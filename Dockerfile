FROM python:3@sha256:86b2fe5e3cf5b979f4b21849ad340762f4a15129583c8134c6c2dc4a880942e6

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "app.py" ]
