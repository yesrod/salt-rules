network:
  service.disabled

systemd-networkd:
  pkg.installed: []
  service.enabled:
    - require:
      - pkg: systemd-networkd

/etc/systemd/network:
  file.directory: []

/etc/systemd/network/80-container-host0.network:
  file.managed:
    - source: salt://network/container/80-container-host0.network
    - template: jinja
    - require:
      - file: /etc/systemd/network
