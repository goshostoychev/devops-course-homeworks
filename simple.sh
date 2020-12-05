#!/bin/bash

## Create homework directory and content.txt file
mkdir -p ~/homework && touch ~/homework/content.txt

## Append current date to content.txt
date >> ~/homework/content.txt

## Change ownership of the sh file
sudo chmod +x simple.sh

## Print the last lines and content of the text file
output=$(cat -n ~/homework/content.txt | tail)
echo $output


## Bonus task

## Create the homework directory if it doesn't exist
## [ ! -d ~/homework ] || mkdir -p ~/homework
