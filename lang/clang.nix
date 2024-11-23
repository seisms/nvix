{
    plugins = {
        lsp.servers.clangd.enable = true;
        conform-nvim.settings = {
            formatters_by_ft.c = [ "clang-format" ];
            formatters.clang-format = {
                command = "clang-format";
            };
        };
    };
}
