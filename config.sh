# generate self-signed certificate and install rhodium w/ various example notebooks
#!/bin/sh

# generate self-signed certificate
openssl req -nodes -newkey rsa:2048 -keyout mykey.key -out server.csr -subj '/C=US/ST=California/L=Santa Monica/O=RAND Corporation/OU=Research Programming Group/CN=localhost'
openssl x509 -req -days 365 -in server.csr -signkey mykey.key -out mycert.pem && rm server.csr

# copy config file
mkdir -p /root/.jupyter/
cp /ipython-docker/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# install rhodium
git clone https://github.com/Project-Platypus/PRIM      PRIM     && cd PRIM      && python setup.py develop
git clone https://github.com/Project-Platypus/Platypus  Platypus && cd Platypus  && python setup.py develop
git clone https://github.com/Project-Platypus/Rhodium   Rhodium  && cd Rhodium   && python setup.py develop

# install example notebooks
git clone https://github.com/saschaishikawa/rdm-simple-model notebook_dir/SimpleModel
