export PS1='\u@\H:\w$ '

LD_LIBRARY_PATH=/usr/local/lib

source ~/.bashrc
source ~/.aliases

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
