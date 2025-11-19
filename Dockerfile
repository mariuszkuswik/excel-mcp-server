FROM python:3.12-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# Install build tools required by some packages during installation
RUN apt-get update && apt-get install -y build-essential gcc && rm -rf /var/lib/apt/lists/*

# Copy minimal project files then install package
COPY pyproject.toml /app/
COPY src /app/src

RUN pip install --no-cache-dir .

EXPOSE 8007

CMD ["python", "-m", "excel_mcp", "streamable-http"]

