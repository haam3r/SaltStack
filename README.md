# SaltStack

Saltstack is used for infrastructure orchestration.
It provides configuration management, distributed command functionality and a lot of other really neat goodies.

Saltstack uses by default a master minion architecture using the ZeroMQ library for fast persistent connections.
This is the case with us as well. SaltStack can also be set up in masterless mode and over SSH.
Servers connected and managed over SaltStack are referred to as "minions".

## Things currently implemented
  - OpenSSH - both server and client configurations. This also ensures that the packages are installed and services are running
  - Software - Ensures packages needed by admins are there.
  - vim - Some handy additions to vim
  - users - Make sure admin users, their credentials and public keys exist on all machines or vice versa that the accounts of old admins are gone.


## Installation
Installation is done using the bootstrap script found at: https://repo.saltstack.com

### Master installation
`curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P -M`

### Minion install
`curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P`

The minion keys also need to be accepted on the master.
The way to do this:
  - `salt-key --list-all` - shows all the keys on the master for all minions regardless of state.
  - `salt-key -a minion.domain.tld` - Accept the key of one specific minion.
  - `salt-key -A` - Accept the keys of all pending minions

## Network requirements
SaltStack uses TCP ports 4505 and 4506 only, which need to be accessible on the master only.
The dns name of salt.domain.tld needs to point to the master server or minion configs have to be changed.