#!/bin/bash

echo '
if [[ -t 1 && -z "$LOLBASH" ]]; then
    export LOLBASH=1
    exec script -qfc "bash" /dev/null | lolcat
fi' >> ~/.bashrc

echo '
if [[ -t 1 && -z "$LOLZSH" ]]; then
    export LOLZSH=1
    exec script -qfc "zsh" /dev/null | lolcat
fi' >> ~/.zshrc

echo '
if test -t 1; and not set -q LOLFISH
    set -Ux LOLFISH 1
    script -qfc "fish" /dev/null | lolcat; exit
end' >> ~/.config/fish/config.fish

