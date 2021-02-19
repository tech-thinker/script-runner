# Script-Runner
It will run script from any public url.

## Environment Variables:
- `SCRIPT_URL`: Is used to specify script url.

## How to use?
### In Docker:
- Create `docker-compose.yaml`
```yaml
version: "3"
services:
  script:
    container_name: script-runner
    image: techthinkerorg/script-runner:1.0.0
    environment:
      - SCRIPT_URL=script-location-url.sh
```
- Run compose file `docker-compose up`

### In Kubernetes:
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
              image: techthinkerorg/script-runner:1.0.0
              env:
                - name: SCRIPT_URL
                  value: "script-location-url.sh"
          restartPolicy: OnFailure
```
- Run command `kubectl apply -f your-deployment-cron.yaml`
