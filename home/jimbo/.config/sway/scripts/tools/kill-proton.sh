#!/usr/bin/env bash

# Terminate Wine and Proton processes with ".exe" or "C:\" in command line
pkill -f '(\.exe|C:\\)' --signal 9

# Terminate all Wine and Proton processes
pkill -f '.*(\.|/)(wine|proton).*' --signal 9

# Terminate any remaining Wine-related processes
pkill -f '.*(\.|/)(wine|proton).*' --signal 9
