Create Self Signed OpenSSL
=========

The following procedure creates a set of certificates / publics keys signed by the rootCA

- Generate a certificate and sign it with rootCA.crt. This is the public key

  ```openssl x509 -req -in $caCertsPath/$serverRole.$serverName.csr -CA $caCertsPath/rootCA.public.crt -CAkey $caCertsPath/rootCA.private.key -CAcreateserial -out $caCertsPath/$serverRole.$serverName.public.crt -days 365```
