--[[
    Button Factory Function
    Creates a new Button object with given x, y coordinates and text for button
    @param _text:string The text to display on the button.
    @param _x:number The x-coordinate of the button.
    @param _y:number The y-coordinate of the button.
    @return table A table representing a button object with methods for drawing.
]]
local function Button(_text, _x, _y)
    return {
        x = _x,
        y = _y,
        height = 50,
        width = 200,
        text = _text,
        color = { 1, 1, 1 },
        background_color = { 0.5, 0.5, 0.5 },
        draw = function(self)
            love.graphics.setColor(self.background_color)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(self.color)
            love.graphics.printf(self.text, self.x, self.y + 10, self.width, "center")
            love.graphics.setColor(1, 1, 1)
        end
    }
end

return Button
