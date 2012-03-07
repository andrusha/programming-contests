#!/bin/bash

egrep -o '[a-z]{1}[A-Z]{3}[a-z]{1}[A-Z]{3}[a-z]{1}' $1 | sed 's/[A-Z]/ /g' | awk '{print $2}' | xargs echo | sed 's/ //g'

