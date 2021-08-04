# FROM dart:2.13.3 AS dev
# WORKDIR /app
# COPY pubspec.* ./
# RUN dart pub get
# EXPOSE 8000
# CMD ["npm", "run", "dev"]

# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:2.13.3 AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe bin/api_grpc_dart.dart -o bin/api_grpc_dart

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM dart:2.13.3
COPY --from=build /runtime/ /
COPY --from=build /app/bin/api_grpc_dart /app/bin/

# Start server.
EXPOSE 2210
CMD ["/app/bin/api_grpc_dart"]