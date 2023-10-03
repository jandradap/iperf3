# iperf3 in a container
#
# Run as Server:
# docker run  -it --rm --name=iperf3-srv -p 5201:5201 networkstatic/iperf3 -s
#
# Run as Client (first get server IP address):
# docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-srv
# docker run  -it --rm networkstatic/iperf3 -c <SERVER_IP>
#
FROM registry.access.redhat.com/ubi9-minimal:9.2-750

# install binary and remove cache
RUN rpm -ivh https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/i/iperf3-3.14-2.fc39.x86_64.rpm

# Expose the default iperf3 server port
EXPOSE 5201

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf3 --help'
ENTRYPOINT ["iperf3"]

