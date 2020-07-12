FROM python:3.7.5-slim

WORKDIR /app

ADD ./candle candle
ADD ./requirements.txt requirements.txt
ADD ./setup.py setup.py
ADD ./MANIFEST.in MANIFEST.in

RUN pip install --upgrade pip \
  && pip install -e .

# パッケージ化したものをローカルにインストールする
RUN python setup.py develop

CMD cd /app && /bin/bash
