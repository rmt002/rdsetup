# How to setup powerline

### 1. Installers
- sudo apt install font-powerline
- sudo pip3 install powerline-shell  (i used v0.7.0)

### 2. Add config file for home user
mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json

### 3. For bashrc (append to it)

function _update_ps1(){
    PS1=$(powerline-shell $?)
}

if[[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

---

### Tweaks for git usage
- now copy the contents of homeconfig.json to the config file in the home/.config/powerline/config.json
- navigate to /usr/local/lib/python3.8/dist-packages/powerline-shell
- check diff between the _init_.py in the repo with the one installed and add accordingly
- in the segments folder open the git.py module and compare it to the one in the repo and add accordingly
