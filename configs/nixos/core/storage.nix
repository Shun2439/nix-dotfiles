{ ... }:
{
  # USB メモリ / 外部ストレージを udisks2 経由で扱う。
  # gvfs は udisks2 と setuid fusermount を暗黙に有効化する
  # (nautilus のゴミ箱・MTP・リモート参照のため)。
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # mountOnMedia は既定 false のまま。マウント先は ACL 管理された
  # /run/media/$USER になり、/media のように他ユーザーと共有されない。

  # exfatprogs / ntfs3g が system.fsPackages に入る。
  boot.supportedFilesystems = [
    "exfat"
    "ntfs"
    "vfat"
  ];

  # udisks2 は nodev,nosuid を強制的に付与するので、残る exec を潰す。
  # 注意: これは udisks2 経由のマウントにだけ効く (sudo mount は対象外)。
  environment.etc."udisks2/mount_options.conf".text = ''
    [defaults]
    defaults=noexec
    allow=noexec,nodev,nosuid,atime,noatime,nodiratime,relatime,strictatime,lazytime,ro,rw,sync,dirsync,noload,acl,nosymfollow
  '';

  # polkit 既定では filesystem-mount と modify-device が allow_active=yes
  # (アクティブセッションなら無認証)。ここでは:
  #   - wheel 以外のローカルユーザーは udisks2 の全アクションを拒否
  #   - 破壊的操作 (フォーマット・パーティション・所有権変更) だけパスワード要求
  # マウント/イジェクトは従来どおり無認証のまま。
  # 認証ダイアログは polkit-agent (home-manager) が担当する。
  environment.etc."polkit-1/rules.d/49-udisks.rules".text = ''
    polkit.addRule(function (action, subject) {
      var id = action.id;
      if (!subject.isInGroup("wheel") && id.indexOf("org.freedesktop.udisks2.") === 0) {
        return polkit.Result.NO;
      }
      if (id === "org.freedesktop.udisks2.modify-device" ||
          id === "org.freedesktop.udisks2.filesystem-take-ownership") {
        return polkit.Result.AUTH_ADMIN_KEEP;
      }
    });
  '';
}
