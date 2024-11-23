{lib, config, ...}:
{
    options = {
        utils.enable = lib.mkEnableOption "Enable utils";
    };
    config = lib.mkIf config.utils.enable {
        nvterm.enable = lib.mkDefault true;
    };
}
