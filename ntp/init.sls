ntp:
  pkg.installed:
    - name: ntp
  service.running:
    - name: ntpd
    - enable: True
    - require:
      - pkg: ntp
      - file: /etc/ntp.conf
      - file: /var/lib/ntp

/etc/ntp.conf:
  file.managed:
    - source: salt://ntp/ntp.conf
    - template: jinja
    - watch_in:
      - service: ntp

/var/lib/ntp:
  file.directory:
    - makedirs: True
