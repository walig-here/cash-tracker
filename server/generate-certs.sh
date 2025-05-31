# Generating self-signed SSL certs for LAN development server

ROOT="/home/workspace/certs"
mkdir "${ROOT}"

cat > "${ROOT}/san.cnf" <<EOL
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
CN = ${SERVER_IP}

[v3_req]
subjectAltName = @alt_names

[alt_names]
IP.1 = ${SERVER_IP}
EOL

# Cleanup
rm -rf "${ROOT}/myCA.key" "${ROOT}/myCA.pem" server.csr server.key

# Private CA key
openssl genrsa -out "${ROOT}/myCA.key" 2048

# Requesting self-signed CA
openssl req -x509 -new -nodes -key "${ROOT}/myCA.key" -sha256 -days 3650 -out "${ROOT}/myCA.pem" -subj "/C=PL/O=MyLANCA/CN=MyLAN Root CA"

# Generating key & certificate for server
openssl genrsa -out "${ROOT}/server.key" 2048
openssl req -new -key "${ROOT}/server.key" -out "${ROOT}/server.csr" -config "${ROOT}/san.cnf"

# Signing server with my self-signed CA
openssl x509 -req -in "${ROOT}/server.csr" -CA "${ROOT}/myCA.pem" -CAkey "${ROOT}/myCA.key" -CAcreateserial -out "${ROOT}/server.crt" -days 825 -sha256 -extfile "${ROOT}/san.cnf" -extensions v3_req

echo "Generated certs! Now mark '${ROOT}/myCA.pem' as trused in your browser (PC) or install it (Android)."