--[[ 
vim.bo buffer scoped options
vim.wo window scoped options
vim.go global-local option 

vim.o.background = 'light'
vim.wo.colorcolumn = '80'

--to show where that directory is for your platform
:echo stdpath('config')

]]
function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

require('loadpacker')

--print(_G.packer_plugins)
if isModuleAvailable('lualine') then
   print('lualine package is loaded')

require('lualine').setup {
    options = { theme = 'wombat' };
    --horizon
    --material
    --molokai
    --onedark
}

    -- this hides the current mode(insert/visual/replace etc) as its already being show in the lualine bar
    vim.opt.showmode = false;
end

require('options')
require('leader')
require('shortcuts')

--[[

print(vim.opt.cursorline:get())
    
vim.o.showcmd = true

vim.opt.guifont = 'Cousine:h16' 

]]
