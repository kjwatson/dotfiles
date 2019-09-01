alias python=python3

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export SC_BUILDVM_HOSTNAME=buildvm
export SC_GIT_USER=jwatson
export SC_GIT_ROOT=~/devel/scale-product
export SC_SRC_ROOT=/local/scale-product
export SC_SCREWI_USER=jwatson
export SC_BUILDVM_HOSTNAME=buildvm
export SC_SKIP_ACKNOWLEDGE=1
export PATH="$PATH:~/bin"
export PATH="/Users/jeremywatson/devel/scbuild/bin:$PATH"

[ -f ~/.scbuild.bash ] && source ~/.scbuild.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH+="$PATH:$HOME/.rvm/bin:$HOME/git/arcanist/bin"
