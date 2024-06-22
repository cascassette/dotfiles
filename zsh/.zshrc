# for profiling zsh startup time
#zmodload zsh/zprof

export EDITOR=nvim

eval "$(oh-my-posh init zsh)"

# git completion setup, from https://www.oliverspryn.com/blog/adding-git-completion-to-zsh
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# to make ... and .... etc work, from https://github.com/knu/zsh-manydots-magic
autoload -Uz manydots-magic
manydots-magic
# added by me
setopt autocd

alias c='clear'
alias o='less'
alias x='exit'
alias d='lsd'
alias e=$EDITOR
alias r='yazi'

alias e.='$EDITOR .'
alias sesh='$EDITOR -S sesh.vim'

alias da='d -a'
alias dla='d -la'
alias late='d -lat'

alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias ga.='git add .'
alias gac='git add . && git commit'
alias gacn='git add . && git commit --no-verify'
alias gaca='git add . && git commit --amend'
alias gc='git commit'
alias gca='git commit --amend'
alias gcn='git commit --no-verify'
alias gcan='git commit --amend --no-verify'
alias gl='git log'
alias gb='git branch --sort=-committerdate'
alias gm='git merge'
alias gmm='git merge main'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gpl='git pull'
#alias gplu='git pull upstream master --rebase'
alias gps='git push'
alias gpsn='git push --no-verify'
alias gco='git checkout'
alias gch='git checkout HEAD --'
alias gcl='git clone'
alias grh='git reset --hard'
alias grv='git remote -vvvvv'
alias gbl='git blame'
alias lg='lazygit'

alias ni='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --location=global'
alias ns='npm start'
alias nr='npm run'
alias nb='npm run build'
alias nrd='npm run dev'
alias nrnb='npm run dev -- --ci'
#alias nfe='npm run fe'
#alias nbe='npm run be'
alias nl='npm ls'
alias nt='npm test'
alias bfb='npm run build && git add . && git commit -m "fix: build"'

alias y='yarn'
alias ys='yarn start'
alias yse='yarn serve'
alias yb='yarn build'
alias yyb='yarn && yarn build'
alias tw='yarn test:watch'

alias du='du -h'
alias df='df -h'

#alias tmux='TERM=screen-256color tmux'

alias mux='tmuxinator'

eval "$(thefuck --alias)"
eval "$(pyenv init -)"

# vim mode
bindkey -v
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# other parts of config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.keys.sh ] && source ~/.keys.sh

# colors
. ~/.config/rose-pine.sh

# for ranger custom config
export RANGER_LOAD_DEFAULT_RC="FALSE"

#source /Users/cas/.config/broot/launcher/bash/br

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load zoxide
eval "$(zoxide init zsh)"

# for profiling zsh startup time
#zprof
