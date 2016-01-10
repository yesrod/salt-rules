/boot/extlinux/challenges.cfg:
  file.managed:
    - source: salt://extlinux/challenges.cfg
    - template: jinja

/boot/extlinux/registration.cfg:
  file.managed:
    - source: salt://extlinux/registration.cfg
    - template: jinja

/boot/extlinux/kiosk.cfg:
  file.managed:
    - source: salt://extlinux/kiosk.cfg
    - template: jinja

/etc/systemd/system/challenges.target:
  file.managed:
    - source: salt://extlinux/challenges.target

/etc/systemd/system/setboot-challenges.service:
  file.managed:
    - source: salt://extlinux/setboot-chellenges.service

/etc/systemd/system/setboot-reg.service:
  file.managed:
    - source: salt://extlinux/setboot-reg.service

/etc/systemd/system/setboot-kiosk.service:
  file.managed:
    - source: salt://extlinux/setboot-kiosk.service

/etc/systemd/system/kiosk.target:
  file.managed:
    - source: salt://extlinux/kiosk.target

daemon-reload:
  cmd.wait:
    - watch:
      - file: /etc/systemd/system/challenges.target
      - file: /etc/systemd/system/setboot-challenges.service
      - file: /etc/systemd/system/setboot-reg.service
      - file: /etc/systemd/system/setboot-kiosk.service
      - file: /etc/systemd/system/kiosk.target
    - name: /usr/bin/systemctl daemon-reload

setboot-challenges:
  service.enabled: []
  require:
    - file: /etc/systemd/system/setboot-challenges.service
    - cmd: daemon-reload

setboot-reg:
  service.enabled: []
  require:
    - file: /etc/systemd/system/setboot-reg.service
    - cmd: daemon-reload

setboot-kiosk:
  service.enabled: []
  require:
    - file: /etc/systemd/system/setboot-kiosk.service
    - cmd: daemon-reload
