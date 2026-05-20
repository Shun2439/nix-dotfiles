{ ... }:
{
  programs.nixvim.extraConfigLua = ''
    if vim.g.neovide then
      vim.g.neovide_opacity = 0.75
      vim.g.neovide_normal_opacity = 0.75

      vim.g.neovide_progress_bar_enabled = true

      vim.g.neovide_cursor_vfx_mode = "railgun"
      vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
      vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 1.0
      vim.g.neovide_cursor_vfx_particle_density = 1.0

      vim.g.neovide_cursor_vfx_particle_curl = 1.5 -- ?

      -- vim.g.neovide_cursor_vfx_mode = "pixiedust" -- 飛蚊みたい...
      -- vim.g.neovide_cursor_vfx_particle_density = 4.0
      -- vim.g.neovide_cursor_vfx_particle_lifetime = 6.0
      -- vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 3.0
    end
  '';
}
