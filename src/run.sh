#!/bin/bash
#makefile to call the source data function on sample dataset and filter for United States, placing both 
#csvs in data directory
# Get the directory of the script
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Clean previous results
cd "$SCRIPT_DIR"
[ -f data/data.csv ] && rm data/data.csv
[ -f data/us.csv ] && rm data/us.csv

# Ensure data directory exists
mkdir -p data

# Source data
cd "$SCRIPT_DIR" && python3 -c "from source_data import download_sample_dataset; url = 'https://raw.githubusercontent.com/datasets/population/master/data/population.csv'; df = download_sample_dataset(url); df.to_csv('data/data.csv', index=False)"

# Filter for United States
cd "$SCRIPT_DIR" && python3 -c "import pandas as pd; df = pd.read_csv('data/data.csv'); us_df = df[df['Country Name'] == 'United States']; us_df.to_csv('data/us.csv', index=False)"

