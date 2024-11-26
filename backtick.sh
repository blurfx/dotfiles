#!/bin/bash
mkdir -p ~/Library/KeyBindings
cat << EOF > ~/Library/KeyBindings/DefaultkeyBinding.dict 
{
    "₩" = ("insertText:", "\`");
}
EOF

