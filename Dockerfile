FROM mcr.microsoft.com/presidio-analyzer:latest

# Installiere deutsche und englische Sprachmodelle
RUN pip3 install --no-cache-dir spacy && \
    python3 -m spacy download de_core_news_md && \
    python3 -m spacy download en_core_web_lg

# Kopiere die NLP-Konfiguration
COPY conf/default.yaml /usr/bin/presidio_analyzer/conf/default.yaml

# Kopiere die Recognizer-Konfiguration
COPY conf/default_recognizers.yaml /usr/bin/presidio_analyzer/conf/default_recognizers.yaml

# DEBUG: Teste YAML-Parsing und zeige den Fehler
RUN python3 << 'EOF'
import yaml
import traceback
try:
    with open('/usr/bin/presidio_analyzer/conf/default_recognizers.yaml', 'r') as f:
        data = yaml.safe_load(f)
        print(f"✅ YAML is valid! Loaded {len(data)} recognizers")
        for i, rec in enumerate(data):
            print(f"  {i+1}. {rec.get('name', 'UNKNOWN')}")
except Exception as e:
    print(f"❌ YAML ERROR: {e}")
    traceback.print_exc()
    exit(1)
EOF

EXPOSE 5001
