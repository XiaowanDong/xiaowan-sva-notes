cat ~/.ssh/id_rsa.pub | ssh -p 22 192.5.53.64 'cat >> .ssh/authorized_keys'
