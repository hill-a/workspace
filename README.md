# Workspace
The workspaces I use regularly. It includes and starts a pre-configured atom editor.

It will setup a local version of Atom and install docker docker.
Then it will git clone this repository of docker images in each of their respective workspace.

Feel free to use/clone/edit/... Just be advised that this repository will probably not be very consistent over time.

## Dependencies

To the best of my knowledge, This only requires cURL.
```bash
sudo apt-get install curl
```

## Setup & Usage

One liner setup, and startup:
```bash
curl -so workspace.sh https://raw.githubusercontent.com/hill-a/workspace/master/workspace.sh && chmod +x ./workspace.sh && ./workspace.sh
```

To re-open the atom editor, simply call:
```bash
./workspace.sh
```

After installation you might need to add the current user to the docker group (if you dont want to call sudo each time):
```bash
sudo usermod -aG docker ${USER}
```
