ntp:
  pkg:
    - latest
  service:
    {% if grains['os'] == 'CentOS' or grains['os'] == 'RedHat' %}
    - name: ntpd
    {% endif %}
    - running
    - watch:
      - file: /etc/ntp.conf
  file.managed:
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' %}
    - name: /etc/ntp.conf
    - source: salt://ntp/files/ntp.conf.ubuntu
    {% elif grains['os'] == 'CentOS' or grains['os'] == 'RedHat' %}
    - name: /etc/ntp.conf
    - source: salt://ntp/files/ntp.conf.redhat
    {% endif %}
    - mode: 644
    - require:
      - pkg: ntp
