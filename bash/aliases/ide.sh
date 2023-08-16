alias .atom='idea . > /dev/null 2>&1 &'


if [ "${myOS}" = "macos" ]; then
  alias .studio='/Applications/Android\ Studio.app/Contents/MacOS/studio . > /dev/null 2>&1 &'
else
  alias .studio='/opt/android-studio/bin/studio.sh . > /dev/null 2>&1 &'
fi

alias .idea='idea . > /dev/null 2>&1 &'

alias .idea.sh='idea.sh . > /dev/null 2>&1 &'
