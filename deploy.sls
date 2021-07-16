{% from '$packageName/map.jinja' import package,config with context %}

stop_application:
  cmd.run:
    - name: ./stop.sh
    - cwd: {{package.target_dir}}/{{package.app_name}}
    - runas: {{package.user}}
    - group: {{package.group}}
    - shell: /bin/bash

delete_application:
  file.absent:
    - name: {{package.target_dir}}/{{package.app_name}}

extract_package:
  archive.extracted:
    - name: {{package.target_dir}}
    - source: salt://{{package.name}}/packages/{{package.name}}-{{package.version}}.tar.gz
    - user: {{package.user}}
    - group: {{package.group}}

generate_config:
  file.recurse:
    - name: {{package.target_dir}}/{{package.app_name}}
    - source: salt://{{package.name}}/files
    - user: {{package.user}}
    - group: {{package.group}}
    - include_empty: True
    - file_mode: 755
    - template: jinja
    - default:
      minion_id: {{grains.id}}
    {%- for key, value in config.iteritems() %}
      {{key}}: {{value|json}}
    {%- endfor %}

chown_package:
  cmd.run:
    - name: chown -R product:product {{package.target_dir}} && chmod -R 755 {{package.target_dir}}
    - cwd: {{package.target_dir}}
    - runas: root
    - shell: /bin/bash

start_application:
  cmd.run:
    - name: ./start.sh
    - cwd: {{package.target_dir}}/{{package.app_name}}
    - runas: {{package.user}}
    - group: {{package.group}}
    - shell: /bin/bash