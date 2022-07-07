#!/bin/sh

# CALL YTDL WITH ARGS PASSED VIA CMD
/usr/bin/youtube-dl $@

# IF DOWNLOAD FAILED
if test $? -ne 0; then

    # TRY UPDATING TO LATEST VERSION AND RETRY
    /usr/bin/youtube-dl -U && /usr/bin/youtube-dl $@

    # IF STILL FAILED EXIT
    if test $? -ne 0; then
        exit 1
    fi
fi


# IF RCLONE CONFIG PROVIDED
if test -f /rclone.conf; then

    # AND $UPLOAD ENV VAR SPECIFIED
    if test ! -z "$UPLOAD"; then

        # MAKE A COPY OF THE CONFIG
        cp /rclone.conf /r.conf

        # UPLOAD DOWNLOADED FILES IN CURRENT DIRECTORY
        rclone --config /r.conf copy --progress . $UPLOAD

        # IF THE CONFIG COPY WAS UPDATED
        if ! diff -q /r.conf /rclone.conf > /dev/null; then

            # UPDATE THE ORIGINAL CONFIG
            cat /r.conf > /rclone.conf
        fi
    fi
fi
