base:
  pkgrepo.managed:
    - humanname: 10Gen Repo
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - dist: precise
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-org
      - pkg: mongodb-org-server
      - pkg: mongodb-org-shell
      - pkg: mongodb-org-mongos
      - pkg: mongodb-org-tools

#  pkg.latest:
#    - name: mongodb-org-server
#    - refresh: False

#mongodb:
#  pkg:
#     - latest
#     - name: mongodb
#  file:
#    - managed
#    - name: /etc/logrotate.d/mongodb
#    - template: jinja
#    - user: root
#    - group: root
#    - mode: 440
#    - source: salt://mongodb/files/logrotate.jinja
#  service:
#     - running
#     - enable: True
#     - watch:
#       - pkg: mongodb
