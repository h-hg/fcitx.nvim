local function get_execute_result(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result
end

local function executable(cmd)
  local result = get_execute_result(cmd)
  return result ~= ""
end

-- check fcitx-remote (fcitx5-remote)
local fcitx_cmd = ""
if executable("fcitx-remote") then
  fcitx_cmd = "fcitx-remote"
elseif executable("fcitx5-remote") then
  fcitx_cmd = "fcitx5-remote"
end

if fcitx_cmd == "" or vim.fn.exists("$DISPLAY") == 0 then
  return
end

function _Fcitx2en()
  local input_status = tonumber(get_execute_result(fcitx_cmd))
  if input_status == 2 then
    -- input_toggle_flag means whether to restore the state of fcitx
    vim.b.input_toggle_flag = true
    -- switch to English input
    os.execute(fcitx_cmd .. " -c")
  end
end

function _Fcitx2NonLatin()
  if vim.b.input_toggle_flag == nil then
    vim.b.input_toggle_flag = false
  elseif vim.b.input_toggle_flag == true then
    -- switch to Non-Latin input
    os.execute(fcitx_cmd .. " -o")
    vim.b.input_toggle_flag = false
  end
end

vim.cmd[[
  augroup fcitx
    au InsertEnter * :lua _Fcitx2NonLatin()
    au InsertLeave * :lua _Fcitx2en()
    au CmdlineEnter [/\?] :lua _Fcitx2NonLatin()
    au CmdlineLeave [/\?] :lua _Fcitx2en()
  augroup END
]]

