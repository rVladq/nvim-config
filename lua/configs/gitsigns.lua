local config = function()
  require("gitsigns").setup {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      local wk = require("which-key")

      local function map(mode, l, r, desc)
        wk.add({
          { l, r, desc = desc or "", mode = mode } -- Use a description if available, or an empty string
        })
      end

      --jump
      map('n', ']g', gitsigns.next_hunk, "next_hunk")
      map('n', '[g', gitsigns.prev_hunk, "prev_hunk")

      --stage
      map('n', '<leader>gs', gitsigns.stage_hunk, "stage_hunk")
      map('n', '<leader>gr', gitsigns.reset_hunk, "reset_hunk")

      map('n', '<leader>gS', gitsigns.stage_buffer, "stage_buffer")
      map('n', '<leader>gR', gitsigns.reset_buffer, "reset_buffer")

      --diff
      map('n', '<leader>gd', function()
        gitsigns.diffthis('~')
      end, "diff_head")

      map('n', '<leader>gc', function()
        vim.ui.input({ prompt = 'Enter commit hash or ref: ' }, function(input)
          if input then
            require('gitsigns').diffthis(input)
          end
        end)
      end, "diff_custom_commit")

      map('n', '<leader>gD', gitsigns.diffthis, "diff_index")

      map('n', '<leader>gp', gitsigns.preview_hunk, "diff_hunk")
      map('n', '<leader>gP', gitsigns.preview_hunk_inline, "diff_hunk_inline")

      --blame
      map('n', '<leader>gb', function()
        gitsigns.blame_line({ full = true })
      end, "blame")

      --toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, "toggle_current_line_blame")
      map('n', '<leader>td', gitsigns.toggle_deleted, "toggle_deleted")
      map('n', '<leader>tw', gitsigns.toggle_word_diff, "toggle_word_diff")
    end
  }
end

return config
