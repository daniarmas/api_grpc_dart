FROM docker.uclv.cu/dart:2.13.3
# Specify the pub.dev url from china
# ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
# ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
ENV PORT=2210
ENV POSTGRESDB_URI='postgres://postgres:postgres@192.168.0.2:54322/postgres'
ENV DATABASE_DATABASE='database'
ENV DATABASE_HOST='192.168.0.2'
ENV DATABASE_PORT=54322
ENV DATABASE_USERNAME='postgres'
ENV DATABASE_PASSWORD='postgres'
# Creating the working directory of the app.
WORKDIR /app
# COPY app source code
COPY . .
RUN dart pub get
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
# RUN dart compile exe bin/api_grpc_dart.dart -o bin/api_grpc_dart
# COPY --from=build /runtime/ /
# COPY --from=build /app/bin/api_grpc_dart /app/bin/
# Expose the server port.
EXPOSE 2210
CMD ["dart", "run"]