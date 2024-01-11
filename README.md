# myflix-videos

## Description

A microservice apart of `Myflix` project created using Nginx sever to server static videos.

## Features

 - **Serve Static Videos**: Allows applications to access videos stored on the server.

## Usage

1. Place static videos inside `/videos` folder.
2. Build and run docker image.
3. Access videos using `ip:port/vidoes/{filename}`.

## Deployment

### Using Docker:

1. Create an docker image from `Dockerfile` in `/src` folder.

```bash
docker build -t myflix-videos .
```

2. Run the docker image.

```bash
docker run -p 5000:5000 myflix-videos
```
