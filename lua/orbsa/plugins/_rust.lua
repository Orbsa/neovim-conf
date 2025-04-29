local crates = require('crates')
crates.setup{
      lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
            -- the same on_attach function as for your other lsp's
        end,
        actions = true,
        completion = true,
        hover = true,
    },
    completion = {
        cmp = {
            enabled = true,
        },
        crates = {
            enabled = true, -- disabled by default
            max_results = 8, -- The maximum number of search results to display
            min_chars = 3 -- The minimum number of charaters to type before completions begin appearing
        }
    }
}

vim.keymap.set("n", "<leader>Ct", crates.toggle, {silent = true, desc =" toggle crates popup"})
vim.keymap.set("n", "<leader>Cr", crates.reload, {silent = true, desc =" reload crates popup"})

vim.keymap.set("n", "<leader>Cv", crates.show_versions_popup, {silent = true, desc =" show versions popup"})
vim.keymap.set("n", "<leader>Cf", crates.show_features_popup, {silent = true, desc =" show features popup"})
vim.keymap.set("n", "<leader>Cd", crates.show_dependencies_popup, {silent = true, desc =" show dependencies popup"})

vim.keymap.set("n", "<leader>Cu", crates.update_crate, {silent = true, desc =" update crate"})
vim.keymap.set("v", "<leader>Cu", crates.update_crates, {silent = true, desc =" update crates"})
vim.keymap.set("n", "<leader>Ca", crates.update_all_crates, {silent = true, desc =" update all crates"})
vim.keymap.set("n", "<leader>CU", crates.upgrade_crate, {silent = true, desc =" upgrade crate"})
vim.keymap.set("v", "<leader>CU", crates.upgrade_crates, {silent = true, desc =" upgrade crates"})
vim.keymap.set("n", "<leader>CA", crates.upgrade_all_crates, {silent = true, desc =" upgrade all crates"})

vim.keymap.set("n", "<leader>Cx", crates.expand_plain_crate_to_inline_table, {silent = true, desc =" expand plain crate to inline table"})
vim.keymap.set("n", "<leader>CX", crates.extract_crate_into_table, {silent = true, desc =" extract crate into table"})

vim.keymap.set("n", "<leader>CH", crates.open_homepage, {silent = true, desc =" open crate homepage"})
vim.keymap.set("n", "<leader>CR", crates.open_repository, {silent = true, desc =" open crate repository"})
vim.keymap.set("n", "<leader>CD", crates.open_documentation, {silent = true, desc =" open crate documentation"})
vim.keymap.set("n", "<leader>CC", crates.open_crates_io, {silent = true, desc =" open crate on crates.io"})
vim.keymap.set("n", "<leader>CL", crates.open_lib_rs, {silent = true, desc =" open crate on lib.rs"})

