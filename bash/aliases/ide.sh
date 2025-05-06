alias .atom='idea . > /dev/null 2>&1 &'


if [ "${myOS}" = "macos" ]; then
  alias .studio='/Applications/Android\ Studio.app/Contents/MacOS/studio . > /dev/null 2>&1 &'
else
  alias .studio='studio . > /dev/null 2>&1 &;disown %'
fi

alias .idea='idea . > /dev/null 2>&1 &'

alias .idea.sh='idea.sh . > /dev/null 2>&1 &'

alias .idea-latest='nohup /home/paul/opt/idea/latest/bin/idea > /dev/null 2>&1 &'