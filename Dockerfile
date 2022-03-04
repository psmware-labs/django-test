FROM python:3.9-alpine
LABEL name=ie.psmware.pyDjangoTest
LABEL vendor="psmware ltd"
LABEL ie.psmware.pyDjangoTest.version="0.1"
LABEL ie.psmware.pyDjangoTest.version.release-date="2022-03-03"
LABEL ie.psmware.pyDjangoTest.version.version.is-production="False"

RUN echo "===> Installing git..." \
    && apk --no-cache upgrade && apk add --no-cache --virtual .build-deps \
    git
RUN echo "===> Installing Django..." \
    && python -m pip install --upgrade pip
COPY requirements.txt /root
RUN pip3 install -r /root/requirements.txt
RUN rm -fR /root/requirements.txt
