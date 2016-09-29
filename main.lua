function love.load()
    Player = require("Player")

    player = Player:new()
    player:switchWeapon("auto1")
end

function love.update(dt)
    if love.keyboard.isDown("1") then
        player:switchWeapon("auto1")
    elseif love.keyboard.isDown("2") then
        player:switchWeapon("auto2")
    elseif love.keyboard.isDown("3") then
        player:switchWeapon("pierce1")
    end
    player:update() -- checks for key presses
    player:updateShots()
end

function love.draw()
    player:draw()
    player:drawShots()
end
