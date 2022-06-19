FROM python:latest

LABEL author="Jones Maxime Murphy III <jones.murphy@onsight.ga>"

ARG repo
ARG DEBUG=true
ARG TESTING=false
ARG FLASK_HOST=0.0.0.0
ARG FLASK_PORT=35000
ARG FLASK_APP="app.py:APP"
ARG FLASK_ENV=development
ARG FLASK_SECRET_KEY=dev

ENV DEBUG=${DEBUG}
ENV TESTING=${TESTING}
ENV FLASK_HOST=${FLASK_HOST}
ENV FLASK_PORT=${FLASK_PORT}
ENV FLASK_APP=${FLASK_APP}
ENV FLASK_ENV=${FLASK_ENV}
ENV FLASK_SECRET_KEY=${FLASK_SECRET_KEY}

WORKDIR /usr/src/app
RUN git init
RUN git remote add -f origin ${repo}

RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install

CMD [ "pipenv", "run", "flask", "run", "app.py"]