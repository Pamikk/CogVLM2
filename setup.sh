sudo apt-get install libopenmpi-dev
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 xformers --index-url https://download.pytorch.org/whl/cu124
pip install -r requirements.txt
#check data
#wget https://huggingface.co/datasets/THUDM/CogVLM-SFT-311K/resolve/main/CogVLM-SFT-311K.zip -O /home/ubuntu/$fs/dataset/CogVLM-SFT-311K.zip
#unzip /home/ubuntu/$fs/dataset/CogVLM-SFT-311K.zip -d /home/ubuntu/$fs/dataset/
