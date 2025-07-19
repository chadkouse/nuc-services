### Frigate

Last retreived version of the Helm chart is unpacked in the `frigate` subdir  
  
To get it again:
```
rm -rf `frigate` # this is the subdir at base/smarthome/frigate/frigate

# add repo
helm repo add blakeblackshear https://blakeblackshear.github.io/blakeshome-charts/

# fetch and unpack chart
helm fetch blakeblackshear/frigate --untar --untardir . # this should be done from within the `frigate` parent dir

# template the chart
helm template kouse.xyz frigate -f ./values.yaml > template.yaml

```

you may need to update the values.yaml file from the unpacked chart as well

