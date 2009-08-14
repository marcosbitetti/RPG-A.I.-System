#!/bin/bash

echo '         (__) '
echo '         (oo) '
echo '   /------\/ '
echo '  / |    ||   '
echo ' *  /\---/\ '
echo '    ~~   ~~   '
date

mxmlc -compiler.optimize -sp=/usr/lib/flash/box2d/ -sp=/usr/lib/flash/papervision3d/src/ -sp=./src/ -target-player=10 -output=./bin/main.swf ./src/Main.as

flashplayer ./bin/main.swf
