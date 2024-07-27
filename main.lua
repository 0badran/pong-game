-- I enlisted ChatGPT to help document the code and add some improvements.
-- https://chatgpt.com/share/c0ef7d93-da71-4cd8-8c51-026c9f3ee566

-- Some resources for learning
-- https://www.youtube.com/watch?v=I549C6SmUnk&t=10231s

_G.love = require("love");
local Ball = require("ball")
local Score = require("score");
local Button = require("button");
local Paddle = require("paddle");


local game_on = false
local selected_button = "play"
function love.load()
    -- Width and Height screen.
    _G.width = love.graphics.getWidth();
    _G.height = love.graphics.getHeight();

    -- Buton location
    local button_x = width * 0.95 - Button().width;
    local button_y = height / 2

    -- Loaded all objects on screen.
    _G.mb3 = love.audio.newSource("sound/background-sound.mp3", "stream")
    _G.video = love.graphics.newVideo("video/menu-video.ogv")
    video:play()
    _G.background = love.graphics.newImage("image/background.png")
    _G.font = love.graphics.newFont("font/basic.ttf", 50)
    love.graphics.setFont(font)
    _G.paddle_l = Paddle(width * 0.02, height / 2, "l");
    _G.paddle_r = Paddle(width * 0.98 - Paddle().width, height / 2, "r");
    _G.ball = Ball()
    _G.score_l = Score("l");
    _G.score_r = Score("r");
    _G.start_button = Button("Play", button_x, button_y)
    _G.quit_button = Button("Quit", button_x, button_y + 100)
end

function love.update(dt)
    if game_on then
        -- Stop video.
        video:pause()
        -- Load audio file.
        love.audio.play(mb3)
        -- Setting left paddle control.
        if love.keyboard.isDown("up") then
            paddle_r:moveUp(dt)
        elseif love.keyboard.isDown("down") then
            paddle_r:moveDown(dt)
        end
        -- Setting left paddle control.
        if love.keyboard.isDown("w") then
            paddle_l:moveUp(dt)
        elseif love.keyboard.isDown("s") then
            paddle_l:moveDown(dt)
        end
        -- Move the ball.
        ball:move(dt)
        -- If a collision with the wall.
        ball:collision_wall();
        -- If a collision with the paddles.
        ball:paddle_collision_l(paddle_l);
        ball:paddle_collision_r(paddle_r);
        -- The right side scores a point.
        if ball.x - ball.radius < 0 then
            score_r.score = score_r.score + 1
            ball:reset_position();
            -- The left side scores a point.
        elseif ball.x - ball.radius > love.graphics.getWidth() then
            score_l.score = score_l.score + 1;
            ball:reset_position();
        end
    else
        -- Rewind the video from beginning.
        video:play()
    end
end

function love.draw()
    love.graphics.draw(video)
    if game_on then
        -- Draw all objects game.
        love.graphics.draw(background)
        ball:draw()
        score_l:draw()
        score_r:draw()
        paddle_l:draw()
        paddle_r:draw()
    else
        -- Draw menu game.
        if selected_button == "play" then
            start_button.color = { 1, 0.84, 0 }
            quit_button.color = { 1, 1, 1 }
        elseif selected_button == "quit" then
            quit_button.color = { 1, 0.84, 0 }
            start_button.color = { 1, 1, 1 }
        end
        start_button:draw()
        quit_button:draw()
    end
end

function love.keypressed(key)
    if key == "return" then
        if not game_on then
            if selected_button == "play" then
                game_on = true
            else
                love.event.quit()
            end
        end
    end
    if key == "up" then
        selected_button = "play"
    elseif key == "down" then
        selected_button = "quit"
    end
end
