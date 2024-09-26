# Power saving configurations
{
  powerManagement.enable = true;
  services.thermald.enable = true; # prevents cpu overheating
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      # Saves long-term battery health but is optional
      # START_CHARGE_THRESH_BAT0 = 40; # 40% and bellow will cause it to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80% and above will stop it from charging
    };
  };
}
