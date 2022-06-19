FROM python:latest

LABEL author="Jones Maxime Murphy III <jones.murphy@onsight.ga>"

WORKDIR /usr/src/app
RUN git init
RUN git remote add -f origin repo

RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install

CMD [ "flask", "run", "app.py"]