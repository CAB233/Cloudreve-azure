#!/bin/sh

cat <<-EOF > /app/conf.ini
[System]
Mode = master

Listen = :5212

Debug = false

SessionSecret = 7cF5vIg8XLKtFOLU2kFNgz6zAkDS8w2Lyw1qSlIkEAod5TewkKPqU9X9b4CtH3qS

HashIDSalt = kfIWhhcteuRACDnXtgkilGDgOdI8c6j2Prn9lUzossrOZn1pi46SXb80XFAaKMF3

[Database]
Type = $DB_TYPE
Port = $DB_PORT
User = $DB_USER
Password = $DB_PASSWORD
Host = $DB_HOST
Name = 	$DB_NAME
TablePrefix = $DB_TABLEPREFIX
EOF

/app/cloudreve -c /app/conf.ini
