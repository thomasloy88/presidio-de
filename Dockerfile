FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN python -m spacy download de_core_news_md && \
    python -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere die Analyzer-Konfiguration
COPY analyzer_de.yml /usr/bin/presidio_analyzer/conf/analyzer_de.yml

EXPOSE 5001
