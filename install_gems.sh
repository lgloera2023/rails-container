#!/bin/bash

while IFS="" read -r p || [ -n "$p" ]
do
  gem install "$p"
done < gems.txt
