---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.17.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

This notebook's dependencies are held constant by the Docker Image created by Dockerfile which used requirements.txt to configure the original notebook's dependency versions. The result output.ipynb is reproducible using the dependencies of its Docker container image.

The Docker Container only works if the notebook if run within it, if I try to run it independently I need to select a kernel. Running the Docker Container (specified in Dockerfile) runs the notebook within the container for reproducability and saves the output (fully ran version to output.ipynb)

If I need to share this image, I can push it to a registry like Docker Hub or GitHub Container Registry so my colleagues can run this notebook reproducibly with its intended dependency versions. A collaborator then pulls my Docker Image and runs the container.

```python
from source_data import download_sample_dataset
```

```python
url = "https://raw.githubusercontent.com/datasets/population/master/data/population.csv"
df = download_sample_dataset(url)
df.head()
```

```python
import matplotlib.pyplot as plt
#Line plot of population of the United States over time
df = df.rename(columns={"Value": "Population"})
US = df.query("`Country Name` == 'United States'")
ax = US.plot(x="Year", y="Population", kind="line")

# Set labels and title
ax.set_xlabel('Year')
ax.set_ylabel('Population')
ax.set_title('Population of the United States Over Time')

plt.show()
```

```python
#Histogram of population distribution
df.hist(column='Population',bins=5)
plt.title('Population Distribution')

# Show the plot
plt.show()
```

```python

```
