base:
  pkgrepo.managed:
    - humanname: 10Gen Repo
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - dist: dist
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-org-server
      - pkg: mongodb-org-shell
      - pkg: mongodb-org-mongos
      - pkg: mongodb-org-tools

server:
  pkg.latest:
    - name: mongodb-org-server
    - refresh: False

shell:
  pkg.latest:
    - name: mongodb-org-shell
    - refresh: False
mongos:
  pkg.latest:
    - name: mongodb-org-mongos
    - refresh: False

tools:
  pkg.latest:
    - name: mongodb-org-tools
    - refresh: False


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
