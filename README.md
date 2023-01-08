# Docker Languagetool

https://languagetool.org

## Download language modules

See https://languagetool.org/download/ngram-data/

For each language:

```shell
mkdir -p ./ngrams
wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip
unzip ngrams-de-20150819.zip -d ./ngrams
rm ngrams-de-20150819.zip
```

## Run server

```shell
docker run -it --rm -v $PWD/ngrams:/ngrams:ro -p8080:8080 ghcr.io/knrdl/docker-languagetool:edge
```

Check is running: `curl 'localhost:8080/v2/check?language=en-US&text=my+text'`
