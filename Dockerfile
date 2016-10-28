FROM fedora:latest
MAINTAINER Daniel Alexander Parkes

RUN dnf -y update && dnf -y clean all

COPY scripts/release-tester.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/release-tester.sh

CMD [ "release-tester.sh" ]
