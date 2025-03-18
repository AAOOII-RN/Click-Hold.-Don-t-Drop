love.graphics.setDefaultFilter("nearest")

wf = require "libraries.windfield"
Object = require "libraries.classic"

function love.load()
    ww, wh = love.window.getMode()

    World = wf.newWorld()

    surface = World:newRectangleCollider(0, wh/2+100, ww, wh/2)

    circle = {
        x = 100,
        y = 100
    }

    local ax, ay = circle.x, circle.y
end

function love.update(dt)
    mx, my = love.mouse.getPosition()
    World:update(dt)

    if love.mouse.isDown(1) then
        circle.x = mx - ax
        circle.y = my - ay
    else
        ax = mx - circle.x
        ay = my - circle.y
    end
end

function love.draw()
    love.graphics.print(tostring(circle.x .. ", " .. circle.y), 100, 100)
    love.graphics.print(tostring(mx .. ", " .. my), 100, 150)
    love.graphics.print(tostring(ax .. ", " .. ay), 100, 200)
    World:draw()
    love.graphics.circle("fill", circle.x, circle.y, 20)
end
