{ icons, opts, lib, config, ... }: {

  imports = [ ./utils.nix ];
  performance.byteCompileLua = {
    enable = true;
    nvimRuntime = true;
  };

  plugins = {
    tmux-navigator.enable = true;
    web-devicons.enable = true;
    nvim-autopairs.enable = true;
  };
  utils.enable = lib.mkDefault true;
  extraConfigLua = # lua
    ''
      local signs = {
          Hint = "${icons.diagnostics.BoldHint}",
          Info = "${icons.diagnostics.BoldInformation}",
          Warn = "${icons.diagnostics.BoldWarning}",
          Error = "${icons.diagnostics.BoldError}",
        }

        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        signs = true,
        severity_sort = true,
        float = {
          border = "${opts.border}",
          source = "always",
          focusable = false,
        },
      })
    '';
}
