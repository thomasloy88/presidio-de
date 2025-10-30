FROM mcr.microsoft.com/presidio-analyzer:latest

RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

EXPOSE 5001
