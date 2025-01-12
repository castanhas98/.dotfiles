-- As per lazy.nvim documentation:
--
-- Make sure to setup `mapleader` and `maplocalleader` before
-- Loading lazy.nvim so that mappings are correct.
-- this is also a good place to setup other settings (vim.opt)
-- 
-- Therefore, we are requiring `remap` before `lazy`
require("francisco.set")
require("francisco.remap")
require("francisco.lazy")

-- `plugins_remap` contains mappings for the plugins, therefore must come after `lazy` 
require("francisco.plugins_remap")

-- Setup for LSPs
require("francisco.lsp")
