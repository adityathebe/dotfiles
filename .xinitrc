#!/bin/bash

[ -f ~/.xprofile ] && ~/.xprofile

xset dpms 0 0 0 b off r rate 500 30
xset s 0
