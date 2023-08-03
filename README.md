# Alpine Smokeping Slave

Image available on [Docker Hub](https://hub.docker.com/r/frostybaggins/alpine-smokeping-slave).

This simple image is built on Alpine Linux, with the appropriate packages installed that are needed for a Smokeping slave instance to run.

Only basic probing functionality is available (fping, tcpping, DNS), so feel free to fork this repository and customise the package installation
in `Dockerfile` to enable more probing types (such as SSH).

## Environment variables

Three environment variables require setting:
- `SLAVE_SECRET`: the shared key/password the slave has with the master to sign messages/data sent between them.
- `SLAVE_NAME`: the device/host name used to identify the slave. This can be anything.
- `MASTER_URL`: The link to the master's `smokeping.cfg` file, e.g. `http://192.168.1.1/smokeping/smokeping.cgi`.
