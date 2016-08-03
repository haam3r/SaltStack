tarkvara:
  pkg.latest:
    - pkgs:
      - {{ salt['pillar.get']('pkgs:htop', 'htop') }}
      - {{ salt['pillar.get']('pkgs:fail2ban', 'fail2ban') }}
      - {{ salt['pillar.get']('pkgs:libswitch-perl', 'libswitch-perl') }}
      - {{ salt['pillar.get']('pkgs:open-vm-tools', 'open-vm-tools') }}
