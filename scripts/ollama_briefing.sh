#!/bin/bash

cd ~/projects/mac-mini-control || exit 1
PROMPT="오늘 아침 브리핑을 5줄로 해줘."

mkdir -p logs

date >> logs/briefing.txt
echo "" >> logs/briefing.txt

ollama run qwen3:30b "$PROMPT" >> logs/briefing.txt

