require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = false, -- This will find and focus the file in the active buffer every time
      --               -- the current file is changed while the tree is open.
    }
  },
  buffers = {
    enabled = true,
  },
  window = {
    mappings = {
      ["J"] = function(state)
        local tree = state.tree
        local node = tree:get_node()
        local siblings = tree:get_nodes(node:get_parent_id())
        local renderer = require('neo-tree.ui.renderer')
        renderer.focus_node(state, siblings[#siblings]:get_id())
      end,
      ["K"] = function(state)
        local tree = state.tree
        local node = tree:get_node()
        local siblings = tree:get_nodes(node:get_parent_id())
        local renderer = require('neo-tree.ui.renderer')
        renderer.focus_node(state, siblings[1]:get_id())
      end
    }
  }
})
