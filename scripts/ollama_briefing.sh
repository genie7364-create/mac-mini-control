#!/bin/bash

cd ~/projects/mac-mini-control || exit 1
news=$(curl -s "https://news.google.com/rss?hl=en-US&gl=US&ceid=US:en" | sed -n 's:.*<title>\(.*\)</title>.*:\1:p' | head -n 5)

PROMPT="today=$(date +%Y-%m-%d).
summarize this news list into a short spoken briefing: $news"



ollama run qwen3:30b --hidethinking "$PROMPT" | say
