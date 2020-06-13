{% set user = pillar.user %}

home-env-user:
  user.present:
    - name: {{ user }}
    - shell: /bin/bash
    - groups:
      - sudo

home-env-configs:
  file.managed:
    - names:
      - /home/{{ user }}/.ssh/authorized_keys:
        - source: salt://files/authorized_keys
        - mode: 600
        - makedirs: True
      - /home/{{ user }}/.vimrc:
        - source: salt://files/.vimrc
      - /home/{{ user }}/.tmux.conf:
        - source: salt://files/.tmux.conf
    - user: {{ user }}
    - group: {{ user }}
    - template: jinja

home-env-sudoers:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}
    - source: salt://files/sudoers
    - mode: 440
    - template: jinja
    - context:
        user: {{ user }}

