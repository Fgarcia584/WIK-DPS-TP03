# DevOps WIK-DPS-TP02

## Build des images Docker

```
docker build -t wik_dps_02_1_layer -f dockerfile_1_layer .

docker build -t wik_dps_02_2_multi_layer -f dockerfile_multi_layer .
```

## Run  les images Docker

```
docker run -d -p 3000:3000 dockerfile_1_layer

docker run -d -p 3000:3000 dockerfile_multi_layer

```