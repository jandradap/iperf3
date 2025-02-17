FROM registry.access.redhat.com/ubi9-minimal:9.3-1552

WORKDIR /tmp

RUN microdnf install -y wget gcc tar gzip \
  && microdnf update glibc \
  && wget https://github.com/esnet/iperf/releases/download/3.15/iperf-3.15.tar.gz \
  && tar -xvf iperf-3.15.tar.gz \
  && cd iperf-3.15 \
  && ./configure\
  && make \
  && make install \
  && microdnf remove -y wget gcc tar \
  && microdnf clean all

EXPOSE 5201

ENTRYPOINT ["iperf3"]
