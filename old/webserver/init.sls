apache:
  pkg.latest:
    - name: {{ salt['pillar.get']('pkgs:apache', 'apache2') }}
  service.running:
    - name: {{ salt['pillar.get']('pkgs:apache', 'apache2') }}
    - require:
      - pkg: {{ salt['pillar.get']('pkgs:apache', 'apache2') }}

/var/www/html/index.html:
  file:
    - managed
    - source: salt://webserver/index.html
    - require:
      - pkg: {{ salt['pillar.get']('pkgs:apache', 'apache2') }}
