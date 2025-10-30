FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere die Recognizer-Konfiguration
COPY conf/default_recognizers.yaml /usr/bin/presidio_analyzer/conf/default_recognizers.yaml

EXPOSE 5001
```

## Schritt 3: Deploy

1. **Commit** beide Änderungen zu GitHub
2. **Restart** in Coolify
3. **Check Logs** - sollte jetzt zeigen: `Loaded recognizer: PatternRecognizer`
4. **Test** mit der Telefonnummer

Nach dem Restart sollte in den Logs stehen:
```
Loaded recognizer: PatternRecognizer
