#!/bin/bash

sed -i '' -e 's/^difficulty.*/difficulty=normal/' /usr/local/bedrock/server.properties
cd /usr/local/bedrock
export LD_LIBRARY_PATH=.
./bedrock_server