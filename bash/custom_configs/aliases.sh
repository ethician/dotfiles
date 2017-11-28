alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

[ -d "/opt/brcm/hndtools-mipsel-linux/bin" ] && path="${path}:/opt/brcm/hndtools-mipsel-linux/bin"
[ -d "/opt/brcm/hndtools-mipsel-uclibc/bin" ] && path="${path}:/opt/brcm/hndtools-mipsel-uclibc/bin"
[ -d "/opt/brcm-arm/bin" ] && path="${path}:/opt/brcm-arm/bin"
if [ -n "${path}" ]; then
  alias asus="echo export PATH=${PATH}:${path}"
  unset path
fi
