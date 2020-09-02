if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.bashrc
export PATH=$PATH:/Users/USERNAME/Library/Android/sdk/platform-tools
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="vi"

export PATH="~/jdk-11.0.2.jdk/bin:$PATH"

export PATH="/usr/local/opt/binutils/bin:$PATH"

# Andorid analysis
export PATH=$PATH:/Users/USERNAME/tools/dex2jar-2.0
alias abe="java -jar /Users/USERNAME/tools/android-backup-tookit/android-backup-extractor/android-backup-extractor-20180521-bin/abe.jar"

# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# .android/avd
alias emu="/Users/USERNAME/Library/Android/sdk/emulator/emulator @Pixel_2_API_24"

# generate password
export PATH="$PATH:/Users/USERNAME/tools/"

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

alias ls='exa'
alias od='hexyl'
alias ps='procs'
alias sublist3r='python3 /Users/USERNAME/tools/Sublist3r/sublist3r.py -d'
alias nc='netcat'
alias cat='bat'
alias powershell='/usr/local/microsoft/powershell/7/pwsh ; exit;'
alias strings='floss'

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


### Virtualenvwrapper
if [ -f /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
fi

export PATH="$PATH:/Users/USERNAME/.composer/vendor/bin"
export PATH="$PATH:/Users/USERNAME/tools/flutter/bin"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"



