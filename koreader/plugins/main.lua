-- main.lua for Tailscale KOReader Plugin

local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local InfoMessage = require("ui/widget/infomessage")
local Dispatcher = require("dispatcher")
local _ = require("gettext")

-- Define the Tailscale plugin as a WidgetContainer
local Tailscale = WidgetContainer:new{
    name = "Tailscale",
}

-- Paths to the scripts in the KUAL Tailscale extension
local startScriptPath = "/mnt/us/extensions/tailscale/bin/start_tailscale.sh"
local receiveScriptPath = "/mnt/us/extensions/tailscale/bin/receive_taildrop.sh"

-- Initialize the Tailscale plugin, registering it in the main menu
function Tailscale:init()
    -- Ensure plugin is added to the main menu
    self.ui.menu:registerToMainMenu(self)
    -- Register actions with KOReader's Dispatcher for consistent event handling
    self:onDispatcherRegisterActions()
end

-- Helper function to execute shell commands and display output in KOReader's UI
local function executeScript(scriptPath)
    local output = io.popen(scriptPath)
    local result = output:read("*all")
    output:close()

    -- Display the result as feedback in KOReader's UI
    UIManager:show(InfoMessage:new {
        text = result,
        timeout = 3,
    })
end

-- Start Tailscale VPN by executing start_tailscale.sh
function Tailscale:startTailscale()
    executeScript(startScriptPath)
end

-- Receive Taildrop files by executing receive_taildrop.sh
function Tailscale:receiveFiles()
    executeScript(receiveScriptPath)
end

-- Register Tailscale options in KOReader's "More Tools" menu
function Tailscale:addToMainMenu(menu_items)
    menu_items.tailscale = {
        text = _("Tailscale"),
        sorting_hint = "more_tools",
        sub_item_table_func = function()
           return self:getSubMenuItems()
        end,
    }
end

-- Define sub-menu items for Tailscale
function Tailscale:getSubMenuItems()
   return {
      {
         text = _("Start Tailscale"),
         keep_menu_open = true,
         callback = function()
            self:startTailscale()
         end,
      },
      {
         text = _("Receive Taildrop Files"),
         keep_menu_open = true,
         callback = function()
            self:receiveFiles()
         end,
      }
   }
end

-- Register actions with the Dispatcher for consistency with KOReader's event handling
function Tailscale:onDispatcherRegisterActions()
    Dispatcher:registerAction("start_tailscale", { 
        category = "none", 
        title = _("Start Tailscale"), 
        event = "StartTailscale",
        callback = function() self:startTailscale() end,
    })
    Dispatcher:registerAction("receive_taildrop", { 
        category = "none", 
        title = _("Receive Taildrop Files"), 
        event = "ReceiveTaildrop",
        callback = function() self:receiveFiles() end,
    })
end

return Tailscale
