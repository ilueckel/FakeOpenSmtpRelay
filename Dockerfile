FROM python:3.7

WORKDIR /usr/src/app

#COPY requirements.txt ./
RUN pip install --no-cache-dir dnspython3 aiosmtpd
RUN openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365  -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=example.com" -out cert.pem

COPY . .

CMD [ "python", "./FakeOpenSmtpRelay.py" ]
