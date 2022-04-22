#!/bin/bash
sudo yum update
sudo yum install -y git
git clone https://github.com/cs220s22/CI-CD-Pipeline_JF_JW.git
cd CI-CD-Pipeline_JF_JW
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
touch .env
echo "API_KEY = ab6c5f31aaa48f332b5ffc67168bf1b69b849442" > .env
.venv/bin/pip install -r requirements.txt
sudo .venv/bin/gunicorn -b :80 simple_app:app &
