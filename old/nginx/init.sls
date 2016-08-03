nginx:
  pkg.latest: []
  service.running:
    - require:
      - pkg: nginx 
