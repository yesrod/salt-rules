lxde:
  module.run:
    - name: pkg.group_install
    - m_name: "LXDE Desktop"

lxdm:
  service.running:
    - enable: True
    - require:
      - file: desktop
      - module: lxde

desktop:
  file.managed:
    - name: /etc/sysconfig/desktop
    - source:
      - salt://desktop/desktop
