# Powerline setup

1. Install python3 and pip3
        
        sudo apt install python3 pip3
2. Install powerline fonts

        sudo apt install font-powerline

    ### WSL extra config
    Since the fonts inside the windows terminal are decided by the fonts present on windows, we need to install them there

    - git clone https://github.com/powerline/fonts.git
    - cd fonts
    - ./install.ps1
    - Sometimes this script will be blocked from running due to windows policy, to remedy this 
        - open an elevated powershell
        - Set-Execution-Policy Unrestricted
        - ./install.ps1
        - Set-Execution-Policy default
    -   Now the font needs to be changed on the Windows Terminal Settings.json ("fontFace" property)

3. Install powerline-shell via pip3
    
        sudo pip3 install powerline-shell (used 0.7.0)

4. Navigate to the home folder of the linux user

        mkdir -p ~/.config/powerline-shell && powerline-shell --generate-config > ~/.config/powerline-shell/config.json

5. Append the following into the .bashrc


        # Powerline config
        function _update_ps1(){
            PS1=$(powerline-shell $?)
        }

        PROMPT_COMMAND="_update_ps1;$PROMPT_COMMAND" 

6. Edit the contents of the config.json created in the home folder


        nano ~/.config/powerline-shell/config.json


    ### The content of the json
        {
          "segments": [
            "newline",
            "virtual_env",
            "username",
            "hostname",
            "ssh",
            "cwd",
            "newline",
            "git",
            "hg",
            "jobs",
            "root"
          ]
        }