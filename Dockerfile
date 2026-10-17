FROM python:3.15.0rc3-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "app.py"]
HEALTHCHECK CMD python -c "\
import urllib.request,sys; \
r=urllib.request.urlopen('http://localhost:8000/health'); \
sys.exit(0 if r.status==200 else 1)"
