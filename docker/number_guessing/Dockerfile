# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV APP_HOME /app

# Create and set working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Copy the Python script into the container
COPY number_guessing.py $APP_HOME

# Run number_guessing.py when the container launches
CMD ["python", "number_guessing.py"]
