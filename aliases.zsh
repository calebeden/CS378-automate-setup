# https://superuser.com/a/665285
## Colorize the ls output ##
alias ls='ls --color=always'
## Use a long listing format ##
alias ll='ls -lAh --color=always'
## Show hidden files ##
alias l.='ls -d .* --color=always'
## Show all files ##
alias la='ls -A --color=always'

## Always colorize things piped into less ##
alias less='less -r'