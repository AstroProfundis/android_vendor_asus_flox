#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery$(getprop ro.boot.slot_suffix):11139072:ac0497f7bb555947059a851cdbd8ad756c34a979; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot$(getprop ro.boot.slot_suffix):6426624:ec7c93aebe31a33af79bc883b7315ae3cf9f9e28 \
          --target EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery$(getprop ro.boot.slot_suffix):11139072:ac0497f7bb555947059a851cdbd8ad756c34a979 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
