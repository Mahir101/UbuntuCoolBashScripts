#!/bin/bash

# Directory to search for mp4 files
directory="."

# Find all mp4 files and calculate their total duration
total_duration=0
while IFS= read -r -d '' file; do
    duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file")
    total_duration=$(echo "$total_duration + $duration" | bc)
done < <(find "$directory" -type f -name "*.mp4" -print0)

# Convert total duration to hours, minutes, and seconds
hours=$(echo "$total_duration/3600" | bc)
minutes=$(echo "($total_duration%3600)/60" | bc)
seconds=$(echo "$total_duration%60" | bc)

echo "Total duration: $hours hours, $minutes minutes, $seconds seconds"
