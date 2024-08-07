FROM python:3.12.4-alpine

WORKDIR /app

RUN addgroup --system --gid 1001 flask
RUN adduser --system --uid 1001 flask

COPY --chown=flask:flask requirements.txt /app
RUN pip3 install -r requirements.txt

COPY --chown=flask:flask . /app

USER flask

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "wsgi:app"]
