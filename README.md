# docker-butterfly-terminal
> Docker build extending [butterfly Terminal](https://github.com/paradoxxxzero/butterfly). 

The Dockerfile adds the following to the base image:
* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
* [hashicorp vault](https://www.vaultproject.io/)
* pip3
* ssh
* curl
* wget
* git
* zip
* unzip
* jq

## Build  
```
docker build --rm -t butterfly:k8s .
```  

## Run
To run a container on port 57575 with no required login:
```
 docker run -d --rm \
  -p 57575:57575 \
  --name butterfly \
  deardooley/butterfly:latest --port=57575
``` 

To run the container on port 57575 with an authenticated login set to `p@ssword`:
```
 docker run -d --rm \
  -p 57575:57575 \
  -e PASSWORD=p@ssword \
  --name butterfly \
  deardooley/butterfly:latest --port=57575 --login
``` 

To preconfigure the vault cli to point to an existing valt server:
```
 docker run -d --rm \
  -p 57575:57575 \
  -e VAULT_TOKEN=96132CAC-C532-4BF4-94F8-79D47197473D \
  -e VAULT_ADDR=https://127.0.0.1:8200 \
  -e VAULT_SKIP_VERIFY=$VAULT_SKIP_VERIFY \
  -e PASSWORD=p@ssword \
  --name butterfly \
  deardooley/butterfly:latest --port=57575 --login
```

## License
GPL
