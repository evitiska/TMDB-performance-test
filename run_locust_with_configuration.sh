#!/bin/sh

mkdir -p reports

if [ "$TEST_TYPE" = "spike" ]; then
  CONFIG="spike.conf"
elif [ "$TEST_TYPE" = "soak" ]; then
  CONFIG="soak.conf"
elif [ "$TEST_TYPE" = "endurance" ]; then
  CONFIG="endurance.conf"
else
  CONFIG="linear.conf"
fi

exec locust --headless --config "configuration/$CONFIG"
