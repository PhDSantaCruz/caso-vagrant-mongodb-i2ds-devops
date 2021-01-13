sudo apt-get update
# Instalación de pip3
sudo apt-get install python3-pip -y
# Instalación de JupyterLab
pip3 install jupyterlab

#Instalación de MongoDB
sudo apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y mongodb 
echo "Mongo instalado \n\n"

sudo systemctl daemon-reload
sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb

# Instalar pymongo
pip3 install pymongo

# Ejecutar script para descarga de datos
chmod a+x download-latest-JHU.sh
./download-latest-JHU.sh

# Ejecutar script para importar los datos a MongoDB
chmod a+x ./mongoimport-everything.sh
./mongoimport-everything.sh "mongodb://localhost/covid19"

# Ejecutar el script de python
python3 ./query_covid19.py