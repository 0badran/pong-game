--[[
    Score Factory Function
    Creates a new Score object
    @param _lado:string "l" for left or "r" for right. Determines the position and color.
    @return table A table representing a score object with methods for drawing.
]]
local function Score(_lado)
    return {
        x = love.graphics.getWidth() * (_lado == 'l' and 0.30 or 0.50),
        y = love.graphics.getHeight() * 0.02,
        font = love.graphics.getFont(),
        score = 0,
        color = string.lower(_lado or "x") == "l" and { 1, 0, 0 } or string.lower(_lado or "x") == "r" and { 0, 0, 1 } or { 1, 1, 1 },
        draw = function(self)
            love.graphics.setColor(self.color[1], self.color[2], self.color[3])
            love.graphics.rectangle("fill", self.x, self.y, 5, 20)
            love.graphics.setColor(255, 255, 255)
            local text = love.graphics.newText(self.font, tostring(self.score))
            love.graphics.draw(text, self.x + 20, self.y + 2)
        end
    }
end

return Score
