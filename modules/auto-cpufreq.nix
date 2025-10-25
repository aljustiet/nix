{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          energy_performance_preference = "performance";
          platform_profile = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          energy_performance_preference = "power";
          platform_profile = "low-power";
          turbo = "never";
          enable_thresholds = true;
          start_threshold = 20;
          stop_threshold = 80;
        };
      };
  };
}
