#!/bin/sh
echo "Kexec Multiboot Vu+ Open Black Hole"
echo $LINE
sleep 1
BOXNAME=$(head -n 1 /etc/hostname)
if [[ "$BOXNAME" == "vuzero4k" ]];then
  wget -O /tmp/kexec-openatv-zero4k.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-zero4k-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-zero4k.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vuuno4k" ]];then
  wget -O /tmp/kexec-openatv-uno4k.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-uno4k-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-uno4k.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vuuno4kse" ]];then
  wget -O /tmp/kexec-openatv-uno4kse.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-uno4kse-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-uno4kse.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vuduo4k" ]];then
  wget -O /tmp/kexec-openatv-duo4k.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-duo4k-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-duo4k.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vuduo4kse" ]];then
  wget -O /tmp/kexec-openatv-duo4kse.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-duo4kse-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-duo4kse.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vusolo4k" ]];then
  wget -O /tmp/kexec-openatv-solo4k.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-solo4k-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-solo4k.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
elif [[ "$BOXNAME" == "vuultimo4k" ]];then
  wget -O /tmp/kexec-openatv-ultimo4k.zip "https://github.com/biko-73/Multiboot_image_selctor/raw/main/kexec-multiboot-ultimo4k-v0.2.4.zip" >/dev/null 2>&1
  cd /tmp
  unzip kexec-openatv-ultimo4k.zip
  sh install.sh
  echo $LINE
  echo "Restart"
  sleep 3
  init 6
else
  echo "This box isn't supported yet"
  exit 1
fi
exit 0
