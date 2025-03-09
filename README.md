# x1watch.sh - X1 Tachyon Validator Log Watcher

`x1watch.sh` is a Bash script designed to monitor the log file of an X1 Tachyon validator (or similar Solana-based validator) in real-time. It provides a slow-motion view of the log with color-coded highlights for key events, making it easier to track validator health, consensus activity, and potential issues.

## Features

- **Real-Time Monitoring:** Tails the log file with a configurable delay (default: 0.3 seconds) for readable output.
- **Color Highlights:** Highlights critical events (e.g., errors, warnings) and operational states (e.g., replay, voting) in distinct colors:
  - **Red:** Errors, delinquency
  - **Yellow:** Warnings, skips, tower updates
  - **Green:** Sync status, leader changes
  - **Blue:** Replay, shreds, votes, ledger activity
- **User Flexibility:** Works with any user’s home directory by default (`$HOME/x1/log.txt`) or accepts a custom log file path as an argument.
- **Portable:** No hardcoded paths—runs seamlessly across different systems and users.

## Prerequisites

- **Bash:** Available on Linux/macOS (standard on most systems).
- **X1 Tachyon Validator:** Assumes a log file is being generated (e.g., by a Solana-based validator).
- **Permissions:** Ensure the script has execute permissions (`chmod +x x1watch.sh`) and read access to the log file.

## Installation

1. **Clone or Download:**
   ```bash
   git clone https://github.com/siatrial/x1watch/blob/main/x1watch.sh
   cd x1watch
