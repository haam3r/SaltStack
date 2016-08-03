base:
  '*':
    #- webserver
    - ntp
    - users
    #- openssh.client #ssh
    - openssh* #ssh.server
    #- openssh.config
    #- openssh.moduli
    #- openssh.known_hosts
    #- openssh.banner
    - software
    - salt-minion
    - edit.vim
    - edit.haam3r_vim