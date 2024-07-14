# Run an Nginx web server container
docker run -d --name nginx-test -p 8080:80 nginx

# Access the Nginx welcome page in your browser
# http://localhost:8080

# ----------

# Run an Apache web server container
docker run -d --name apache-test -p 8081:80 httpd

# Access the Apache welcome page in your browser
# http://localhost:8081

# ----------

# Run a Flask app container
docker run -d --name flask-test -p 5000:5000 python:3.9-slim bash -c "pip install flask && echo 'from flask import Flask, request; app = Flask(__name__); @app.route("/") def home(): return \"Hello, Docker!\";' > app.py && FLASK_APP=app.py flask run --host=0.0.0.0"

# Access the Flask app in your browser
# http://localhost:5000

# ----------

# Run an Alpine Linux container
docker run -it --name alpine-test alpine /bin/sh

# You will be inside the Alpine Linux container with a shell prompt

# ----------

# Run a GitLab Runner container
docker run -d --name gitlab-runner-test -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner:latest

# Register the GitLab Runner with your GitLab instance (more setup required for real use)
