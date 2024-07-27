--[[
    Configures the game window properties.
    @param t:table The table containing the window configuration options.
]]
function love.conf(t)
    -- Set the window title
    t.window.title = "Pong Game"
    -- Set the game version
    t.gameversion="1.0"
    -- Set the window icon
    t.window.icon = "image/icon.png"
    -- Set the window width
    t.window.width = 1100
    -- Set the window height
    t.window.height = 759
end
