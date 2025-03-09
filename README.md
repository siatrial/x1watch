x1watch.sh - X1 Tachyon Validator Log Watcher

This script monitors an X1 Tachyon validator log in real-time with a slow-motion view (0.3s delay) and color-coded highlights for key events like errors, replays, and leader changes.

Features:
- Tails the log file at $HOME/x1/log.txt by default or a custom path.
- Highlights: Red (errors), Yellow (warnings, skips, tower), Green (sync, leader changes), Blue (replay, shreds, votes, ledger).
- Portable across users with $HOME.

Usage:
1. Clone: git clone https://github.com/siatrial/x1watch.git
2. Make executable: chmod +x x1watch.sh
3. Run default: ./x1watch.sh
4. Run custom: ./x1watch.sh /path/to/log.txt

Example Output:
Watching /home/user/x1/log.txt in slow motion (delay: 0.3s). Press Ctrl+C to stop.
REPLAY: [2025-03-09T10:55:42.529557101Z] new fork:57806117 (in blue)
LEADER CHANGE: [2025-03-09T10:55:42.529207175Z] LEADER CHANGE at slot: 57806116 (in green)

Customize:
- Edit DELAY (e.g., DELAY=0.5) for speed.
- Change DEFAULT_LOG_FILE for a different default path.

Troubleshooting:
- "Log file not found": Check path/permissions.
- No colors: Ensure terminal supports ANSI.

Contributions welcome via issues/pull requests!
