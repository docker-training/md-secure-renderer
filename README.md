# Secure Markdown Renderer
Renders markdown projects from encypted tar files

## Usage
1. Create a `.dockerignore` file, and include any files or directories you want to exclue.  This should look similar to your `.gitignore` file.
```
#.dockerignore

.vscode/
```

2. Create Dockerfile in the root of the project you want to render.  **TODO: Add build arg for key**
```
#Dockerfile

#TODO: change to ubuntu and add openssl
FROM node:6.11.0 as builder

COPY . /content

ARG KEY

WORKDIR /content

RUN tar -czf - * | openssl enc -e -aes256 -k $KEY -out content.tar.gz

FROM broyal/md-secure-renderer:0.1

COPY --from=builder /content/content.tar.gz /app/content.tar.gz
```

3. Build Dockerfile
```
$ docker build -t example --build-arg KEY=password .
```

4. Run container
```
$ docker run -e KEY=password -p 8080:8080 yourimage
```

## Contruting
