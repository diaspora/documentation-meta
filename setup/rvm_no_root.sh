#!/usr/bin/env sh

# this script installs rvm with the most recent stable version of ruby
# and makes sure it is not run as root,
# based on my earlier attempt for a general purpose root avoidance
# https://gist.github.com/3930399

# the command we'll be running
export RVM_CMD="curl -sSL https://get.rvm.io | bash"

# put some colors in there
case "$TERM" in
  xterm*|rxvt*)
    read -r red RED cyan CYAN NC <<'EOT'
\033[0;31m \033[1;31m \033[0;36m \033[1;36m \033[0m
EOT
    ;;
esac

# don't run as root!
if [ `id -u` -eq 0 ] ; then
  printf "${red}don't run this script as ${RED}root${red}!${NC}\n"
  exit 1
fi

# execute
eval "$RVM_CMD"
