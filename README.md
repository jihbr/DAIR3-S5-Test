# DAIR3-S5-Test

## Clone the Repository
Run the following command to clone the repo:
```bash
git clone https://github.com/jihbr/DAIR3-S5-Test.git
```
## Data Directory Setup
The `data/` directory was generated by executing:
```bash
src/run.sh
```
*(Ensure `run.sh` has executable permissions: `chmod +x run.sh`)*

## Docker Usage
The file `output.ipynb` is the result of running `eda.ipynb` (.md in repository) in the Docker container. To ensure `output.ipynb` is accessible after running the container, mount a volume with:
```bash
docker run --rm -v "$(pwd)/src:/app/src" my-docker-image
```
**Note**: `my-docker-image` is the name of actual image created. The Docker Image has not yet been shared publicly.
