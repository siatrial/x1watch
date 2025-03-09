#!/bin/bash
# x1watch.sh - Watch X1 Tachyon validator log with slow motion and highlights

# Default log file in the current user's home directory
DEFAULT_LOG_FILE="$HOME/x1/log.txt"

# Check if a custom log file path is provided as an argument
if [ $# -eq 1 ]; then
    LOG_FILE="$1"
else
    LOG_FILE="$DEFAULT_LOG_FILE"
fi

# Delay between lines (in seconds)
DELAY=0.5

# Colors for highlighting
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to process and highlight log lines
highlight_log() {
    while IFS= read -r line; do
        # Critical issues
        if echo "$line" | grep -qi "error" && ! echo "$line" | grep -q "=0i\|error: Ok(0)"; then
            echo -e "${RED}ERROR: $line${NC}"
        elif echo "$line" | grep -qi "warn" && ! echo "$line" | grep -q "=0i"; then
            echo -e "${YELLOW}WARNING: $line${NC}"
        elif echo "$line" | grep -qi "skip" && ! echo "$line" | grep -q "=0i"; then
            echo -e "${YELLOW}SKIP: $line${NC}"
        elif echo "$line" | grep -qi "delinquent"; then
            echo -e "${RED}DELINQUENT: $line${NC}"
        elif echo "$line" | grep -qi "slot missed"; then
            echo -e "${YELLOW}SLOT MISSED: $line${NC}"
        # Startup-specific issues
        elif echo "$line" | grep -qi "tower"; then
            echo -e "${YELLOW}TOWER: $line${NC}"
        elif echo "$line" | grep -qi "ledger"; then
            echo -e "${BLUE}LEDGER: $line${NC}"
        # Positive states
        elif echo "$line" | grep -qi "caught up"; then
            echo -e "${GREEN}SYNC: $line${NC}"
        elif echo "$line" | grep -qi "leader change"; then
            echo -e "${GREEN}LEADER CHANGE: $line${NC}"
        # Validator operations
        elif echo "$line" | grep -qi "replay"; then
            echo -e "${BLUE}REPLAY: $line${NC}"
        elif echo "$line" | grep -qi "shred"; then
            echo -e "${BLUE}SHRED: $line${NC}"
        elif echo "$line" | grep -qi "vote"; then
            echo -e "${BLUE}VOTE: $line${NC}"
        else
            echo "$line"  # Normal lines unhighlighted
        fi
        sleep "$DELAY"  # Slow down the output
    done
}

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file $LOG_FILE not found!"
    echo "Usage: $0 [custom_log_file_path]"
    echo "Default log file: $DEFAULT_LOG_FILE"
    exit 1
fi

# Start tailing the log and pipe to highlighting function
echo "Watching $LOG_FILE in slow motion (delay: ${DELAY}s). Press Ctrl+C to stop."
tail -f "$LOG_FILE" | highlight_log
