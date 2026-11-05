{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver

      # Vulkan (Mesa ANV) is what llama.cpp uses for iGPU inference
      vulkan-loader
      vulkan-tools # vulkaninfo, for debugging
    ];
  };
}
