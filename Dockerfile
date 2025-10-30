FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

# Kopiere NUR die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# KEINE custom recognizers - verwende die Standard-Ones
# Die Standard-Recognizers unterstützen bereits Phone, Email, etc.

EXPOSE 5001
