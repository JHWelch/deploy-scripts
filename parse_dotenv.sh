#!/bin/bash
# Export the vars in .env into your shell:
export $(egrep -v '^#' .env | xargs)