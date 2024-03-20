# Use an official Python runtime as the base image
FROM python:3.9-slim AS base

# Set the working directory in the container
WORKDIR /app

# Copy the project requirements file into the container
COPY requirements.txt .

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create a new stage for copying the code and model
FROM base AS app

# Copy the entire project directory into the container
COPY . .

# Set the FLASK_APP environment variable
ENV FLASK_APP=app.py

# Expose the Flask port
EXPOSE 5000

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
