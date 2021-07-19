#!/bin/bash

./configure \
    --arch=aarch64 \
    --target-os=android \
    --enable-cross-compile \
    --enable-version3 \
    --disable-doc \
    --disable-avdevice \
    --disable-swresample \
    --disable-postproc \
    --disable-avfilter \
    --enable-runtime-cpudetect \
    --enable-shared --disable-static \
    --enable-small \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-encoders \
    --disable-decoders \
    --disable-parsers \
    --disable-muxers \
    --disable-demuxers \
    --enable-parser=h264 \
    --enable-muxer=rtp \
    --enable-protocols \
    --enable-bsfs \
    --enable-debug \
    --disable-asm \
    --extra-cflags="-DANDROID" \

./ffbuild/version.sh . libavutil/ffversion.h

sed -i 's/HAVE_PTHREAD_CANCEL 1/HAVE_PTHREAD_CANCEL 0/g' config.h

echo "The configure of FFmpeg for $CPU is completed"