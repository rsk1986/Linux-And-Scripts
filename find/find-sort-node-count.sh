* sort based on the "node count" in the subdirectories
find . -maxdepth 1 -type d -exec ls -ld {} \; | sort -k 5,5
find . -maxdepth 1 -type d -exec ls -ld {} \; | sort -nr -k 5,5 | head -30