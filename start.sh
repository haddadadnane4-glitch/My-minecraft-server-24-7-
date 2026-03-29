#!/bin/bash

java -Xmx1G -Xms1G -jar server/paper.jar nogui &

node web/index.js