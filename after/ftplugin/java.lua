local jdtls = require 'jdtls'

local root_markers = { '.git', 'gradlew', 'build.gradle', 'settings.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

if not root_dir then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.stdpath 'data' .. '/jdtls-workspace/' .. project_name

local mason_registry = require 'mason-registry'
local jdtls_path = mason_registry.get_package('jdtls'):get_install_path()

local cmd = {
  jdtls_path .. '\\bin\\jdtls.bat',
  '-data',
  workspace_dir,
}

local config = {
  cmd = cmd,

  root_dir = root_dir,

  settings = {
    java = {
      import = {
        gradle = {
          enabled = true,
        },
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
      },
      format = { enabled = true },
    },
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
