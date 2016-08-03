{% for user, args in pillar.get('users', {}).iteritems() %}
{{user}}:
  group:
    - present
  user.present: 
    - fullname: {{ args['fullname'] }}
    - gid_from_name: True
    - password: {{ args['hash'] }}
    - shell: /bin/bash
    {% if grains['os'] == 'Ubuntu' %}
    - groups:
      - sudo
      - adm
      - dip
      - cdrom
      - plugdev
    {% endif %}

{% if args['ssh-keys'] %}
{{user}}_key:
  ssh_auth.present:
    - user: {{user}}
    - names:
      {% for key in args['ssh-keys'] %}
      - {{ key }}
      {% endfor %}
{% endif %}
{% endfor %}
