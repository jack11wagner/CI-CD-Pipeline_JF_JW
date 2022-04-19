#!/bin/bash
sudo yum update
sudo yum install -y git
git clone https://github.com/cs220s22/CI-CD-Pipeline_JF_JW.git
cd CI-CD-Pipeline_JF_JW
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
sudo .venv/bin/python3 -b :80 simple_app.py &
