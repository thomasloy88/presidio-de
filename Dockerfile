FROM mcr.microsoft.com/presidio-analyzer:latest

RUN pip install --no-cache-dir spacy==3.7.4 && \
    pip install --no-cache-dir \
      https://github.com/explosion/spacy-models/releases/download/de_core_news_md-3.7.0/de_core_news_md-3.7.0-py3-none-any.whl \
      https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.7.0/en_core_web_lg-3.7.0-py3-none-any.whl

COPY analyzer_de.yml /app/analyzer/conf/analyzer_de.yml
ENV ANALYZER_CONFIG_FILE=/app/analyzer/conf/analyzer_de.yml
