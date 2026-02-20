FROM python:3.14

WORKDIR /fastapi-app

COPY fastapi-app/requirements.txt /fastapi-app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /fastapi-app/requirements.txt


COPY fastapi-app/main.py /fastapi-app/

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]