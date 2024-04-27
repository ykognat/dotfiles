local function get_luajit_include_path()
    local system_type = vim.loop.os_uname().sysname
    if system_type == "Linux" then
        -- Check if it's NixOS by testing for a typical Nix store directory
        local handle = io.popen("test -d /nix/store && echo 'nixos'")
        local result = handle:read("*a")
        handle:close()
        if result:match("nixos") then
            local handle = io.popen("echo $(dirname $(readlink -f $(which luajit)))/../include")
            local lua_include_path = handle:read("*a"):gsub("%s+$", "")  -- Trim trailing whitespace
            handle:close()
            return lua_include_path
        end
    end
    return nil  -- Return nil if not Linux/NixOS or path not found
end

local lua_include_path = get_luajit_include_path()
local luarocks_build_args = {}
if lua_include_path then
    luarocks_build_args = {"--with-lua-include=" .. lua_include_path}
end

return {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  opts = {
    luarocks_build_args = luarocks_build_args,
  },
}
