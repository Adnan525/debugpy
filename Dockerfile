FROM python:3.12.3-alpine

WORKDIR /app

COPY . /app

# Install requirements and debugpy
RUN pip install --no-cache-dir debugpy -r requirements.txt || pip install --no-cache-dir debugpy

# Start Python with debugpy listening for debugger on 0.0.0.0:5678
# CMD ["python", "-m", "debugpy", "--listen", "0.0.0.0:5678", "--wait-for-client", "factorial.py"]
CMD ["python", "factorial.py"]