export PS1="⚆_⚆ \w$ "
export PATH+="$PATH:$HOME/.rvm/bin:$HOME/devel/scbuild/bin:$HOME/git/arcanist/bin:$HOME/devel/scripts/"
export EDITOR=vim
export CSCOPE_EDITOR=vim

. $HOME/git/z/z.sh

alias syncToBuildVM='rsync -avzh -e ssh --include='.git' --exclude='*.swp' ~/devel/scale-product/* buildvm:/local/scale-product'
alias clangMyShit='git diff -U0 HEAD^ | clang-format-diff.py -i -p1'
alias lintMyShit='git ls-files | grep \.js$ | xargs -L1 -P24 /opt/scale/lib/node_modules/eslint/bin/eslint.js --fix'
alias vim='nvim'
alias up='cd ..;'
alias gc='git checkout'
alias gf='git fetch'
alias gb='git branch'
alias gr='git rebase'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gs='git status'
alias gl='git log'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

ssh-add -K ~/.ssh/*sa

cd ~/devel/scale-product

scwip() {
    git push origin HEAD:refs/for/sb_drsd/noop
}

scpush() {
    git push origin HEAD:refs/for/sb_drsd/build_type=opt
}

scplus1() {
    git push origin HEAD:refs/for/sb_drsd/build_type=opt
    changeid=$(git show -s | grep "Change-Id" | awk '{print $2}')
    gerrit_revision=$(ssh -p 29418 gerrit.lab.local gerrit query --current-patch-set "$changeid" | grep -A2 currentPatchSet | grep "revision" | awk '{print $2}')
    ssh -p 29418 gerrit.lab.local gerrit review --code-review +1 "$gerrit_revision"
}

cdScribed() {
    cd ~/devel/scale-product/daemons/scribed
}

flashkbd() {
    cwd=$(pwd)
    cd ~/git/qmk_firmware
    make kbd6x:derp:dfu
    cd cwd
}

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"
export SC_SKIP_ACKNOWLEDGE=1

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
. ~/.bashrc
