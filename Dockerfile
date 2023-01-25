FROM python:3@sha256:6b85854518f812d94cf2dfee2386df85b9cb78835a872d4769b4335f584c43ba

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "app.py" ]
