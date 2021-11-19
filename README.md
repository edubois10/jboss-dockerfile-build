# jboss-dockerfile-build

```
# Creating build configuration
oc new-build jboss-eap73-openjdk11-openshift:7.3 --binary=true --name=weather-app

# Starting the build
oc start-build weather-app --from-dir=deployments/ --follow

# Creating configmaps with the overlay to apply
oc apply -f resources/jboss-cli-cm.yaml
oc apply -f resources/index-cm.yaml

# Creating deployment
oc apply -f resources/deployment.yml
```

