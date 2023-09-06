FROM alpine:latest

LABEL maintainer="Lewis Lebentz - https://lew.im"

ENV PATH="/opt/bin:$PATH" \
    SOURCE_URL="https://github.com/taers232c/GAMADV-XTD3.git"

RUN apk add --update --no-cache bash git python py-openssl py-pip \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/bin \
    && git clone ${SOURCE_URL} /opt/gam \
    && ln -s /opt/gam/src/gam.py /opt/bin/gam \
    && touch /opt/gam/src/nobrowser.txt \
    && touch /opt/gam/src/noupdatecheck.txt

RUN pip install --upgrade python-dateutil filelock google-auth-oauthlib google-api-python-client

WORKDIR /root
ENTRYPOINT ["/bin/bash"]
