#!/bin/bash

OUTPUT_FILE="system_metrics.txt"

# Collect CPU metrics
echo "CPU Metrics:" > $OUTPUT_FILE
top -bn1 | grep "Cpu(s)" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Collect Memory metrics
echo "Memory Metrics:" >> $OUTPUT_FILE
free -m >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Collect System details
echo "System Details:" >> $OUTPUT_FILE
uname -a >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "Metrics gathered successfully. Check the $OUTPUT_FILE file for details."
