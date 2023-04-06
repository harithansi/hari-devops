# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV APP_HOME /app

# Create and set working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Create logs directory
RUN mkdir logs

# Copy the script into the container
COPY number_guessing.py $APP_HOME/

# Set logs directory as a volume
VOLUME /app/logs

# Run number_guessing.py when the container launches
CMD ["python", "number_guessing.py"]
