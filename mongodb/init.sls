base:
  pkgrepo.managed:
    - humanname: 10Gen Repo
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - dist: dist
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
{% if grains['mongo_node_role'].rfind('server') > 0 %}
      - pkg: mongodb-org-server
{%endif%}
      - pkg: mongodb-org-shell
{% if grains['mongo_node_role'].rfind('mongos') > 0 %}
      - pkg: mongodb-org-mongos
{%endif%}
      - pkg: mongodb-org-tools

{% if grains['mongo_node_role'].rfind('server') > 0 %}
server:
  pkg.latest:
    - name: mongodb-org-server
    - refresh: False
  file:
    - managed
    - name: /etc/mongodb.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 440
    - source: salt://mongodb-formula/mongodb/files/mongodb.conf
    - context:
        replicaSetName: {{ grains['replicaSetName'] }}
{%endif%}

shell:
  pkg.latest:
    - name: mongodb-org-shell
    - refresh: False

{% if grains['mongo_node_role'].rfind('mongos') > 0 %}
mongos:
  pkg.latest:
    - name: mongodb-org-mongos
    - refresh: False
{%endif%}

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
