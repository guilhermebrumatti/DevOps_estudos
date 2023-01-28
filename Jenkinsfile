name: CI
on:
  workflow_dispatch:
  push:
    branches: [main]
jobs:
  publish-hello-docker-image:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - name: Build the hello-docker Docker image
        run: |
               docker build . --tag ghcr.io/guilhermebrumatti/desafio1:latest
               docker run ghcr.io/guilhermebrumatti/desafio1:latest
               docker push ghcr.io/guilhermebrumatti/desafio1:latest
