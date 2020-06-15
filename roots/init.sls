{% set user = salt['pillar.get']('user', 'alex') %}
{% set home = salt['pillar.get']('home', '/home/' ~ user) %}
{% set keypath = salt['pillar.get']('keypath', home ~ '/.ssh/authorized_keys') %}

home-env-user:
  user.present:
    - name: {{ user }}
    - shell: /bin/bash
    - groups:
      - sudo

home-env-configs:
  file.managed:
    - names:
      - {{ keypath }}:
        - source: salt://files/authorized_keys
        - mode: 600
        - makedirs: True
      - {{ home }}/.vimrc:
        - source: salt://files/.vimrc
      - {{ home }}/.tmux.conf:
        - source: salt://files/.tmux.conf
    - user: {{ user }}
    - template: jinja

home-env-bashrc:
  file.append:
    - name: {{ home }}/.bashrc
    - text: "export EDITOR=vim\nexport LANG=C.UTF-8"

home-env-sudoers:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}
    - source: salt://files/sudoers
    - mode: 440
    - template: jinja
    - context:
        user: {{ user }}

