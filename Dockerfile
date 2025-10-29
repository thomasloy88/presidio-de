FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche Sprachmodelle
RUN python -m spacy download de_core_news_md
RUN python -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere die Analyzer-Konfiguration (falls vorhanden)
COPY analyzer_de.yml /usr/bin/presidio_analyzer/conf/analyzer_de.yml

EXPOSE 5001
