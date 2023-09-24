#!/bin/bash

echo Started.

# -l 0 to set logging most verbose, default is 8
crond -f -l 0
