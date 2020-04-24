FROM python:3.7

#Run PIP install
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

#Copy App into /app which is standard for python docker files
COPY ./app /app
#Run uvicorn server on port 80 listening on all interfaces
EXPOSE 8080
CMD ["uvicorn", "app.main:app", "--port 8080"]