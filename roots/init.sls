{% set user = pillar.get('user') %}
{% set home = salt['pillar.get']('home', '/home/' ~ user) %}
{% set username = pillar.get('username') %}
{% set email = pillar.get('email') %}

home-install-pkgs:
  pkg.installed:
    - pkgs:
      - sudo
      - vim
      - tmux

home-env-user:
  user.present:
    - name: {{ user }}
    - usergroup: True
    - shell: /bin/bash
    - groups:
      - sudo

home-env-files:
  file.recurse:
    - name: {{ home }}
    - source: salt://home
    - file_mode: 600
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - template: jinja
    - context:
        username: {{ username }}
        email: {{ email }}

home-env-env:
  file.append:
    - name: {{ home }}/.bashrc
    - text: |
        export EDITOR=vim
        export LANG=en_US.utf8

home-env-sudoers:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}
    - source: salt://sudoers
    - mode: 440
    - template: jinja
    - context:
        user: {{ user }}

