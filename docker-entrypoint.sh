#!/bin/sh

# PERFORM SELF-UPDATE
/usr/bin/youtube-dl -U

# CALL (POSSIBLY) UPDATED BINARY WITH ARGS PASSED VIA CMD
/usr/bin/youtube-dl $@

# IF RCLONE CONFIG PROVIDED
if test -f /rclone.conf; then

    # AND $UPLOAD ENV VAR SPECIFIED
    if test ! -z "$UPLOAD"; then

        # UPLOAD DOWNLOADED FILES IN CURRENT DIRECTORY
        rclone --config /rclone.conf copy --progress . $UPLOAD
    fi
fi
