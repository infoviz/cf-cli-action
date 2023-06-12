#!/bin/sh -l

cf api "$INPUT_CF_API"
cf install-plugin multiapps -f

if [ -n "$INPUT_CF_ORIGIN_KEY" ]; then
  cf login --origin $INPUT_CF_ORIGIN_KEY -a $INPUT_CF_API -u $INPUT_CF_USERNAME -p $INPUT_CF_PASSWORD -o $INPUT_CF_ORG -s $INPUT_CF_SPACE
else
  cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

sh -c "cf $*"
