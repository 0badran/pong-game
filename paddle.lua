--[[
    Paddle Factory Function
    Creates a new Paddle object with given x, y coordinates and side ('l' for left, 'r' for right)
    @param _x: number - The x-axis position.
    @param _y: number - The y-axis position.
    @param _lado: string - The side of the paddle ('l' for left, 'r' for right), default color is white if not 'l' or 'r'.
    @return table - A paddle object with properties and methods to move and draw the paddle.
]]

-- Constants for colors
local COLORS = {
    RED = { 1, 0, 0 },
    BLUE = { 0, 0, 1 },
    WHITE = { 1, 1, 1 }
}

local function Paddle(_x, _y, _lado)

    return {
        -- Paddle properties
        x = _x,
        y = _y,
        width = 25,
        height = 130,
        speed = 200,
        -- Color based on side ('l' is red, 'r' is blue, default is white)
        color = string.lower(_lado or "x") == "l" and COLORS.RED or string.lower(_lado or "x") == "r" and COLORS.BLUE or
            COLORS.WHITE,

        -- Method to move the paddle up
        -- @param self: table - The paddle object
        -- @param dt: number - Delta time for frame-independent movement
        moveUp = function(self, dt)
            self.y = self.y - self.speed * dt
            if self.y < 0 then
                self.y = 0
            end
        end,

        -- Method to move the paddle down
        -- @param self: table - The paddle object
        -- @param dt: number - Delta time for frame-independent movement
        moveDown = function(self, dt)
            self.y = self.y + self.speed * dt
            if self.y + self.height > love.graphics.getHeight() then
                self.y = love.graphics.getHeight() - self.height
            end
        end,

        -- Method to draw the paddle on the screen
        -- @param self: table - The paddle object
        draw = function(self)
            love.graphics.setColor(self.color)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(COLORS.WHITE) -- Reset color to white
        end,
    }
end

return Paddle
