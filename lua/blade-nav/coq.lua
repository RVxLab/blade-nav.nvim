local M = {}

M.setup = function()
  local status, _ = pcall(require, "coq")
  if not status then
    return
  end

  require("blade-nav.coq_blade")
  require("blade-nav.coq_php")
  require("blade-nav.coq_routes")
end

return M
