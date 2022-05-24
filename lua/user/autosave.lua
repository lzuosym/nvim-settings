-- Setup autosave
local present, autosave = pcall(require, "autosave")
if not present then
  vim.notify("autosave plugin not found")
  return
end

autosave.setup(
  {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    -- events = { "InsertLeave" },
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 600000, -- 10 minutes
    debounce_delay = 60000 --  2 minutes
  }
)
