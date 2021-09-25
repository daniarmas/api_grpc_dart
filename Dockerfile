FROM dart:2.13.3

ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

WORKDIR /app
COPY . .
RUN dart pub get
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe lib/client.dart -o lib/client
# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
RUN dart compile exe bin/api_grpc_dart.dart -o bin/api_grpc_dart
RUN rm gen.sh
# Expose the server port.
EXPOSE 2210
CMD [ "/bin/bash", "-c", "bin/api_grpc_dart" ]