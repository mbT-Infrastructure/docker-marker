# Marker image

This image contains [Marker]. It converts all files in the input folder to Markdown. Also an API
server can be startet by using the command `run-marker-server.sh`.

## Installation

1. Pull from [Docker Hub], download the package from [Releases] or build using `builder/build.sh`

## Usage

### Environment variables

- `AI_API_KEY`
    - Key to use for authorization to the AI API server.
    - Also used for the surya inference server unless `SURYA_INFERENCE_API_KEY` is set.
- `AI_API_URL`
    - Url of the AI API server.
    - Also used for the surya inference server unless `SURYA_INFERENCE_URL` is set.
- `AI_MODEL`
    - The AI model to use.

### Volumes

- `/media/marker`
    - The overall data directory for marker.
- `/media/marker/input`
    - The directory for input files.
- `/media/marker/output`
    - The output directory.
- `/media/marker/models`
    - The model cache directory.

## Development

To build and run the docker container for development execute:

```bash
docker compose --file docker-compose-dev.yaml up --build
```

[Docker Hub]: https://hub.docker.com/r/madebytimo/marker
[Marker]: https://github.com/datalab-to/marker
[Releases]: https://github.com/mbt-infrastructure/docker-marker/releases
