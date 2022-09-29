# map4sci Windows Setup

## WSL2 + Ubuntu Setup

1. Install WSL2 and the Ubuntu distribution: [tutorial](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview)
2. Install Docker in Ubuntu: [tutorial](https://docs.docker.com/engine/install/ubuntu/)
3. Add your user to docker group in Ubuntu terminal:
   `sudo gpasswd -a $USER docker`
4. Restart WSL from powershell:
   `wsl --shutdown`

## Python setup

From Ubuntu Terminal:

```bash
cd map4sci
sudo apt install -y python3 python3-venv graphviz
python3 -m venv .venv
source .venv
pip3 install networkx pygraphviz
```

## Add networks to run in map4sci

Place new networks (in GEPHI JSON Export format) in [map4sci/input-data](./map4sci/input-data/).

## Running map4sci

From Ubuntu Terminal:

```bash
cd map4sci
source .venv/bin/activate
./run.sh
```

All new networks will be built and a site deployed to [docs](./docs/)
