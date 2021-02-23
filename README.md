# Lighthouse checks
This script will launch a Lighthouse check using a Chrome instance.

## How to use
Just run this bash script:
```bash
./lighthouse-checks.sh
```

## Automatize
You can automatically trigger this script with any automated pipelines.

### Bitbucket pipelines
To add this script into your Bitbucket pipelines, open/create your bitbucket-pipelines.yml file from the root of your repository and add a custom step :

```yaml
custom: # defines that this can only be triggered manually or by a schedule
    lighthouse-checks:
      - step:
          name: Lighthouse Check
          image: node:12.13.0
          caches:
            - node
          script:
            - chmod +x lighthouse-checks.sh # make the script executable
            - ./lighthouse-checks.sh $LIGHTHOUSE_URL_TO_CHECK
```

Then you can create a schedule inside of Bitbucket pipelines for `lighthouse-checks`.