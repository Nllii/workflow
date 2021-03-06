from picker import pick
import os
import subprocess
shell_scripts_dir = os.path.dirname(os.path.abspath(__file__))
shell_scripts= os.path.join(shell_scripts_dir, 'scripts')
# BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE = range(8)

def individual_requirements():
    title = 'Install individual requirements: '
    options = [' - docker ', '-cockpit-project']
    option, index = pick(options, title, indicator='=>', default_index=0)
    return option, index
    



def server_setup():
    title = 'SERVER SETUP TASK: '
    options = [' - setup the important requirements', '-setup individual requirements']
    option, index = pick(options, title, indicator='=>', default_index=0)
    return option, index
    



def docker_task():
    title = 'DOCKER TASK: '
    options = ['docker build && run', 'docker compose up', 'update containers restart to - always']
    option, index = pick(options, title, indicator='=>', default_index=0)
    return option, index



def repo_task():
    title = 'REPO TASK: '
    options = ['git commit','create new repo']
    option, index = pick(options, title, indicator='=>', default_index=0)
    return option, index


def _admin_task():
    title = 'DEVELOPMENT TASK: '
    options = ['git','docker','server-setup','permission this directory']
    option, index = pick(options, title, indicator='=>', default_index=0)
    return option, index




option, index = _admin_task()
if index == 0:
    git_option, git_index = repo_task() 
    if git_index == 0:
        ask_input = input('Enter commit message: ')
        subprocess.call(['bash', shell_scripts + '/git_commit.sh', str(ask_input)])
    elif git_index == 1:
        subprocess.call(['bash', shell_scripts + '/create-repo.sh'])



elif index == 1:
    docker_option, docker_index = docker_task()
    if docker_index == 0:
        subprocess.call(['bash', shell_scripts + '/docker-build.sh', '-build'])
    elif docker_index == 1:
        subprocess.call(['bash', shell_scripts + '/docker-build.sh', '-compose-build'])
    elif docker_index == 2:
        subprocess.call(['bash', shell_scripts + '/docker-build.sh', '-update-containers'])


elif index == 2:
    server_option, server_index = server_setup()
    print(server_index)
    if server_index == 0:
        subprocess.call(['bash','server.sh', '-everything'])
    if server_index == 1:
        individual_options, individual_index = individual_requirements()
        print("still working on this part... script is still in being worked on")

        # subprocess.call(['bash', shell_scripts + '/setup-server.sh', '-everything'])


elif index == 3:
    print("adding permission using sudo chmod -R a+rwx  ./ ")
    subprocess.call(['bash',shell_scripts + '/permission.sh','-permissions'])





