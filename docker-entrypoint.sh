#!/bin/sh

# PERFORM SELF-UPDATE
/usr/bin/youtube-dl -U

# CALL (POSSIBLY) UPDATED BINARY WITH ARGS PASSED VIA CMD
/usr/bin/youtube-dl $@
