-- To add documentation for code and improve performance.
-- https://chatgpt.com/share/c0ef7d93-da71-4cd8-8c51-026c9f3ee566

--[[
    Ball Module
    This module creates a Ball object with properties and methods to control its movement, collision, and drawing in a LOVE2D game.
--]]

local function Ball()
    -- Initial speed of the ball
    local initial_speed = 150

    return {
        -- Initial position of the ball (center of the screen)
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        
        -- Ball radius
        radius = 10,
        
        -- Initial movement speed of the ball
        x_move = initial_speed,
        y_move = initial_speed,
        
        -- Speed increment factor for each bounce
        increase_speed = 0.05,
        
        -- Move the ball by updating its position based on the time elapsed (dt)
        move = function(self, dt)
            self.x = self.x + self.x_move * dt
            self.y = self.y + self.y_move * dt
        end,
        
        -- Invert the y-axis movement direction and increase speed slightly
        bounce_y = function(self)
            self.y_move = self.y_move * -1
        end,
        
        -- Invert the x-axis movement direction and increase speed slightly
        bounce_x = function(self)
            self.x_move = self.x_move * -1
        end,
        
        -- Reset the ball position to the center of the screen and reset speed
        reset_position = function(self)
            self.x = love.graphics.getWidth() / 2
            self.y = love.graphics.getHeight() / 2
            self.x_move = initial_speed
            self.y_move = initial_speed
        end,
        
        -- Draw the ball on the screen
        draw = function(self)
            love.graphics.circle("fill", self.x, self.y, self.radius)
        end,
        
        -- Check for collision with the top or bottom walls and bounce if needed
        collision_wall = function(self)
            if self.y - self.radius < 0 or self.y + self.radius > love.graphics.getHeight() then
                self:bounce_y()
                self.y_move = self.y_move + (self.y_move * self.increase_speed)
                self.x_move = self.x_move + (self.x_move * self.increase_speed)
            end
        end,
        
        -- Check for collision with the left paddle and bounce if needed
        paddle_collision_l = function(self, paddle)
            if self.x - self.radius < paddle.x + paddle.width and
                self.x + self.radius > paddle.x and
                self.y + self.radius > paddle.y and
                self.y - self.radius < paddle.y + paddle.height then
                self.x = paddle.x + paddle.width + self.radius
                self:bounce_x()
            end
        end,
        
        -- Check for collision with the right paddle and bounce if needed
        paddle_collision_r = function(self, paddle)
            if self.x + self.radius > paddle.x and
                self.x - self.radius < paddle.x + paddle.width and
                self.y + self.radius > paddle.y and
                self.y - self.radius < paddle.y + paddle.height then
                self.x = paddle.x - self.radius
                self:bounce_x()
            end
        end,
    }
end

-- Return the Ball module
return Ball
