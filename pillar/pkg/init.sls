pkgs:
  {% if grains['os_family'] == 'RedHat' %}
  apache: httpd
  vim: vim-enhanced
  {% elif grains['os_family'] == 'Debian' %}
  apache: apache2
  vim: vim
  htop: htop
  fail2ban: fail2ban
  libswitch-perl: libswitch-perl
  open-vm-tools: open-vm-tools
  {% elif grains['os'] == 'Arch' %}
  apache: apache
  vim: vim
  {% endif %}
