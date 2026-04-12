{ config, pkgs, ... }: {
  services.ollama = {
    enable = true;
    # Pick one package based on your GPU:
    # package = pkgs.ollama-cuda;   # NVIDIA
    # package = pkgs.ollama-rocm;   # AMD
    # package = pkgs.ollama-vulkan; # Vulkan (generic GPU)
    # Default (pkgs.ollama) is CPU only

    # Models to preload at startup:
    loadModels = [ "gemma4:e4b" ];
  };
}
