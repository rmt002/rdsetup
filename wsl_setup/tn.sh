#!/bin/sh 
# This script allows the user to change the title bar of the terminal window
# Usage 
# bash tn.sh  <newTitleBarName>
echo -ne "\033]0;$1\a"