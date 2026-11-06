{ ... }:
{
  # hardware.nvidia.* は services.xserver.videoDrivers に "nvidia" が無いと
  # 丸ごと無効になる (nixpkgs の実装が videoDrivers を見ている)。
  # "modesetting" を残すのは iGPU 側の Xorg 設定を維持するため。
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    # GA104 (RTX 3070 Ti) は open カーネルモジュール対応。
    # 595 系では open を明示しないと assertion で eval が落ちる。
    open = true;

    nvidiaSettings = true;

    # eGPU では不要。どちらもノート PC 内蔵 dGPU 向けの機能。
    # 常駐させると抜き差し時に不整合が出やすいので無効のままにする。
    powerManagement.enable = false;
    nvidiaPersistenced = false;
  };

  # niri が eGPU 上で描画するようになったため、Wayland コンポジタで既知の
  # VRAM 解放遅れを抑える (niri 公式 wiki の Nvidia ページの対策)。
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-niri-vram.json".text = builtins.toJSON {
    rules = [
      {
        pattern = {
          feature = "procname";
          matches = "niri";
        };
        profile = "Limit Free Buffer Pool On Wayland Compositors";
      }
    ];
    profiles = [
      {
        name = "Limit Free Buffer Pool On Wayland Compositors";
        settings = [
          {
            key = "GLVidHeapReuseRatio";
            value = 0;
          }
        ];
      }
    ];
  };
}
