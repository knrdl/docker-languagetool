FROM docker.io/eclipse-temurin:18-jre

RUN apt-get update && \
    apt-get install --yes hunspell hunspell-de-de hunspell-en-us unzip && \
    wget https://languagetool.org/download/LanguageTool-stable.zip && \
    unzip LanguageTool-stable.zip && \
    mv LanguageTool-*.*/ /opt/LanguageTool && \
    rm LanguageTool-stable.zip && \
    apt-get purge --yes unzip && \
    rm -rf /var/lib/apt/lists/*

USER nobody

VOLUME /ngrams

WORKDIR /opt/LanguageTool

CMD java -cp languagetool-server.jar org.languagetool.server.HTTPServer --port 8080 --allow-origin "*" --public --languageModel /ngrams

EXPOSE 8080/tcp
