{
    plugins.lps.servers.clangd.enable = true;
    conform.nivm.settings = {
        formatters_by_ft.c = [ "clang-format" ];
        formatters.clang-format = {
            command = "clang-format";
        };
    };
}
