#!/bin/sh

xcodebuild clean build test \
  -project vincerp.xcodeproj \
  -scheme vincerp \
  -sdk iphonesimulator \
  ONLY_ACTIVE_ARCH=NO \
  GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
  GCC_GENERATE_TEST_COVERAGE_FILES=YES \
  CODE_SIGN_IDENTITY="" \
  CODE_SIGNING_REQUIRED=NO