# Use the official Dart image.
FROM google/dart:latest

# Create and change to the app directory.
WORKDIR /app

# Copy the pubspec file and install dependencies.
COPY pubspec.yaml .
RUN dart pub get

# Copy the rest of the application code.
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run the app
CMD ["dart", "run", "main.dart"]
