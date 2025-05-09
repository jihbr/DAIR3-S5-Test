#!/usr/bin/env python3

import pandas as pd
import requests
import io

def download_sample_dataset(url: str) -> pd.DataFrame:
    """
    Downloads a sample dataset from the given URL and returns it as a DataFrame.

    Parameters:
    url (str): The URL of the dataset to download.

    Returns:
    pd.DataFrame: The downloaded dataset.
    """
    try:
        response = requests.get(url, verify=False)
        response.raise_for_status()  # Raise an error for bad responses
        data = pd.read_csv(io.StringIO(response.text))
        print("Dataset successfully downloaded.")
        return data
    except Exception as e:
        print(f"An error occurred: {e}")
        return pd.DataFrame()

if __name__ == "__main__":
    # URL of the sample dataset
    url = "https://raw.githubusercontent.com/datasets/population/master/data/population.csv"
    # Download the dataset
    sample_data = download_sample_dataset(url)
    print(sample_data.head())  # Display the first few rows of the dataset

