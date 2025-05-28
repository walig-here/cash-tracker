# *CashTracker* client 

This is a client app code for CashTracker. 

## Structure

- `cash-tracker-client` - main source code;
- `certs` - SLL certs files. May not be visible until SSL certificates for dev servers are generated;

## Running a development server

### Prerequisites

You need to have *Docker* installed.

### Steps

1. Create *CashTracker Client* image & run interactive docker container that uses this image by invoking command:

    ```bash
    ./run-container.sh
    ```

2. In container's `/home/workspace` dir create a `.env` file where you define server's IP address stored in `SERVER_IP` env variable. Example:

    ```bash
    SERVER_IP=192.168.34.1
    ```

3. Source the created `.env` file to export you defined `SERVER_IP`.

    ```bash
    source .env
    ```

4. Generate SSL certificates to make your HTTPS sever trustable withing your LAN by running the `generate-certs.sh` script. It will create the `/home/workspace/certs` directory that contains following files:
    
    - `myCA.key` - private key for signing server's SSL certificate;
    - `myCA.pem` - self-generated SSL certificate for signing server's certificate;
    - `server.crt` - server's SSL certificate self-signed with `myCA.pem` certificate;
    - `server.csr` - request file for `server.crt` certificate;
    - `server.key` - server's private key;

5. Add the `myCA.pem` certificate to a pool of trusted, authorized SSL certificates of your browser. This way the browser would trust the development server & allow the browser to treat the system as a proper PWA.

6. Run development server with `run-dev-server.sh` script. It would run in LAN on `SERVER_IP` an port *5173*.
