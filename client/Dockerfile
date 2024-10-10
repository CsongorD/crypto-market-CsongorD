# Use the official Flutter image as base
FROM ghcr.io/cirruslabs/flutter:3.24.3

# Set the working directory inside the container
WORKDIR /home/dev

# Copy the current directory contents into the container
COPY . .

# Expose the port for the Flutter web server
EXPOSE 8080

ENTRYPOINT ["sh","./entrypoint.sh"]
