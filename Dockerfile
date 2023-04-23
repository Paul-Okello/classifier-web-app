# Use an official Python runtime as a parent image
FROM python:3.9.6-alpine3.14

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Set environment variables
ENV FLASK_APP app.py
ENV FLASK_ENV production


# Expose port 5500 for gunicorn
EXPOSE 5500

# Run the command to start the gunicorn server
CMD ["waitress-serve", "--listen=*:5500", "app:app"]

