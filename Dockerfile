# Use the official Python image from the Docker Hub
FROM python:3.13-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter
RUN pip install jupyter

# Run the setup script or command
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "src/eda.ipynb", "--output", "src/output.ipynb"]

# Note: To ensure output.ipynb is accessible, run the container with a volume mount:
#docker run --rm -v "$(pwd)/src:/app/src" my-docker-image 