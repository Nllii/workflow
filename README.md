###  Workflow is a script to setup a Raspberry pi as a server for developement running ubuntu 22.04. Basic minimal setup.
##### For web developement docker images will be used. Setting up ngnix, apache, maven etc... usually has ports conflicts, and it is a pain to figure out which program is using which ports. 

- all scripts and programs are runing ubuntu 22.04 LTS on arm64 

### Gettting started
setup your path to have ./workflow/dev
1. cd into ./workflow 
2. 
```bash 
bash install-dev.sh 

```
### with 30 Mbps download speed you are looking at ETA of setup to be 1hr and fixing little errors. 

### keep run runing the script until all downloads are done and Reboot your system before working on your code. 

- Happy hacking !

-




- list of installations
    - python _ https://github.com/conda-forge/miniforge/
    - golang
    - node
    - npm 
    - java
    - Rust
    - portainer _ https://github.com/portainer/portainer
    - docker _ https://www.docker.com || _ https://download.docker.com/linux
    - jellyfin _ https://github.com/jellyfin/jellyfin
    - cockpit-project _ https://cockpit-project.org
    - docpht _ https://github.com/docpht/docpht
    - hapttic _ https://github.com/jsoendermann/hapttic
    - immich _ https://github.com/alextran1502/immich
    - snikket-server _ https://github.com/snikket-im/snikket-server
    - libreddit _ https://github.com/spikecodes/libreddit
    - javascript_xmpp_client _ https://www.npmjs.com/package/simple-xmpp/v/2.3.1 || https://github.com/simple-xmpp/node-simple-xmpp
    - javascript refrences https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference
    


[snikket-server config](https://github.com/Nllii/workflow/blob/9ca64008ff525d0f85f36260d120f38d8dcbce5c/workflow.settings.toml#L18)
~~ notifications are sent using snikket-server~~
```bash
you can use any xmmp client to get notifications from this script
```








Release notes:
- v0.0.1 
    - using makefile(s)
    - fix some issues with toml and javascript - can't return value from toml 




- v0.0.0
    - Added commit project
    - Added github support
    - Add start django server
    - Added Docker script 
    - Added Portainer
    - Add golang 






credits:

-  https://github.com/borjapazr/mars-server.git
-  https://github.com/wong2/pick
 
TODO:
- [x] provide a better installing scripts without using 3rd party libraries
- [x] Clean repo history 
```bash

know issues to fix
1. - if the system stops responding via ssh discount it from the network(if wifi, kick it off the network and reconnet) and ssh again.

2. Restart system and keep reboot until it everything is installed. 

```




Notes: 
- https://quickref.me/toml


https://stackoverflow.com/questions/6791889/git-untrack-a-file-in-local-repo-only-and-keep-it-in-the-remote-repo


git update-index --assume-unchanged services/im_message/snikket/snikket.conf
git update-index --no-assume-unchanged <file>
git ls-files -v | grep '^h '