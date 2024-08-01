#!/bin/bash
find /path/to/your/folder -type f -size +100M -exec rm -i {} \;
