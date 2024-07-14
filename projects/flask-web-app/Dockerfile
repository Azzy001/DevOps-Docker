FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 80
CMD ["python", "web_app.py"]


FROM nginx:alpine
COPY index.html /usr/share/nginx/html
EXPOSE 80

