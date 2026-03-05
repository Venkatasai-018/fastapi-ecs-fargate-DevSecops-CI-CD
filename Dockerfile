FROM python:3.12-slim

WORKDIR /app

COPY fastapi-app/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY fastapi-app/ /app/

EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]