FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN apt-get update; apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev
RUN pip install -r requirements.txt
ADD web/* /code/
RUN python -m textblob.download_corpora
