alias .atom='idea . > /dev/null 2>&1 &'


if [ "${myOS}" = "macos" ]; then
  alias .studio='/Applications/Android\ Studio.app/Contents/MacOS/studio . > /dev/null 2>&1 &'
else
  alias .studio='nohup studio . > /dev/null 2>&1 &'
fi

alias .idea='nohup idea . > /dev/null 2>&1'

alias .idea.sh='nohup idea.sh . > /dev/null 2>&1 &'

alias .idea-latest='nohup /home/paul/opt/idea/latest/bin/idea > /dev/null 2>&1 &'
