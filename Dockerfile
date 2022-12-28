FROM amd64/ubuntu:latest
FROM amd64/dart:latest

WORKDIR /dart_application

COPY ./ ./

RUN snap install flutter --classic
RUN flutter analyze lib
RUN dart fix lib --dry-run
RUN dart fix lib --apply
RUN flutter format lib
RUN flutter pub get
RUN flutter pub deps
RUN flutter pub upgrade
RUN flutter test test/darttest.dart
RUN flutter build aar lib/main.dart /bin/aar/flutter_application
RUN flutter build apk lib/main.dart /bin/apk/flutter_application
RUN flutter build appbundle lib/main.dart /bin/appbundle/flutter_application
RUN flutter build bundle lib/main.dart /bin/bundle/flutter_application
RUN flutter build linux lib/main.dart /bin/linux/flutter_application
RUN flutter build web lib/main.dart /bin/web/flutter_application
RUN snap install snapcraft --classic          
RUN snapcraft

CMD [ "/bin/linux/dart_application" ]
