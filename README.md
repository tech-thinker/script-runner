# Script-Runner
It will run script from any public url or local file.

## Environment Variables:
- `SCRIPT_URL`: Is used to specify script url.
- `SCRIPT_PATH`: Is used to specify local script file.

## How to use?
### Using Docker:
- Create `Dockerfile`
```
FROM techthinkerorg/script-runner:1.1.0
WORKDIR /script
COPY ./your-script.sh /script/
ENV SCRIPT_PATH "your-script.sh"
```
or
```
FROM techthinkerorg/script-runner:1.1.0
ENV SCRIPT_URL "script-location-url.sh"
```
- Run `docker build  -f ./Dockerfile -t your-image-name .`
- Run `docker run your-image-name`

### Using Docker Compose:
- Create `docker-compose.yaml`
```yaml
version: "3"
services:
  script:
    container_name: script-runner
    image: techthinkerorg/script-runner:1.1.0
    environment:
      - SCRIPT_URL=script-location-url.sh
```
- Run compose file `docker-compose up`

### Using Kubernetes:
- Create `your-deployment-corn.yaml`
```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: your-deployment-cron
  namespace: your-name-space
spec:
  schedule: "*/5 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: your-deployment-cron
              image: techthinkerorg/script-runner:1.1.0
              env:
                - name: SCRIPT_URL
                  value: "script-location-url.sh"
          restartPolicy: OnFailure
```
- Run command `kubectl apply -f your-deployment-cron.yaml`
