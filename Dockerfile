FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere die Recognizer-Konfiguration
COPY conf/default_recognizers.yaml /usr/bin/presidio_analyzer/conf/default_recognizers.yaml

# DEBUG: Zeige Datei und validiere
RUN cat /usr/bin/presidio_analyzer/conf/default_recognizers.yaml && \
    python3 -c "import yaml; yaml.safe_load(open('/usr/bin/presidio_analyzer/conf/default_recognizers.yaml'))" && \
    echo "YAML validation passed!"

EXPOSE 5001
