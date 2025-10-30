FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration (mit NER-Mapping)
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere Custom Recognizers (inkl. deutscher Telefonnummern)
COPY conf/default_recognizers.yaml /usr/bin/presidio_analyzer/conf/default_recognizers.yaml

EXPOSE 5001
