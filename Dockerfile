FROM ubuntu

# Install Python and pip
RUN apt update && \
    apt install python3-pip -y

# Install Python packages
RUN pip3 install Flask tensorflow pillow

# Set the working directory inside the container
WORKDIR /app

# Copy the entire current directory contents into the container at /app
COPY . /app

# Copy the EfficientNet model file into the correct location within the container
# Adjust the source path according to its location relative to the Dockerfile's location
COPY webapp/model/efficientnetv2s.h5 /app

# Expose the port the app runs on
EXPOSE 8000

# Command to run the app
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
