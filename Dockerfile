FROM squidfunk/mkdocs-material:latest

COPY user-documentation/scripts/requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

ADD overrides/ /docs/overrides
COPY mkdocs.yml /docs/

COPY scripts/entrypoint.sh /docs/entrypoint.sh
RUN chmod 755 /docs/entrypoint.sh

ENTRYPOINT ["sh", "/docs/entrypoint.sh"]
CMD ["serve", "--dev-addr=0.0.0.0:8011"]
