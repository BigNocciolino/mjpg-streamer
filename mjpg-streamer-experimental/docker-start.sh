#!/bin/sh
set -e

# Set the library path for the loader
export LD_LIBRARY_PATH="/mjpg-streamer/plugins/"
# Start the streamer with external parameters
./mjpg_streamer -i "$1" -o "$2"