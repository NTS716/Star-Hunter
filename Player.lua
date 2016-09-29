local Player = {}

function Player.new(self)
    Bullet = require("Bullet")

    self.xpos = 0
    self.ypos = 0

    self.width = 50
    self.height = 50

    self.speed = 350

    self.fire_rate = 0
    self.proj_speed = 250
    self.proj_size = 20

    self.weaponType = "auto1"

    cooldown = 0

    self.shots = {}

    local instance = {}

    for key,value in pairs(Player) do
        instance[key] = value
    end

    return instance
end

function Player.draw(self)
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", self.xpos, self.ypos, self.width, self.height)
end

function Player.update(self)
    cooldown = math.max(cooldown - love.timer.getDelta(), 0)

    if love.keyboard.isDown("d") then
        -- move right
        self.xpos = self.xpos + self.speed * love.timer.getDelta()
    elseif love.keyboard.isDown("a") then
        -- move left
        self.xpos = self.xpos - self.speed * love.timer.getDelta()
    end

    if love.keyboard.isDown("w") then
        -- move up
        self.ypos = self.ypos - self.speed * love.timer.getDelta()
    elseif love.keyboard.isDown("s") then
        -- move down
        self.ypos = self.ypos + self.speed * love.timer.getDelta()
    end

    if love.keyboard.isDown("space") and cooldown == 0 then
        self:shoot()
    end
end

function Player.switchWeapon(self,type)
    if type == "auto1" then
        self.fire_rate = 0.35
        self.proj_size = 20
        self.proj_speed = 250
        self.weaponType = "auto"

    elseif type == "auto2" then
        self.fire_rate = 0.25
        self.proj_size = 20
        self.proj_speed = 300
        self.weaponType = "auto"

    elseif type == "pierce1" then
        self.fire_rate = 0.45
        self.proj_size = 25
        self.proj_speed = 450
        self.weaponType = "pierce"
    end
end

function Player.shoot(self)
    local bullet = Bullet:new(self.xpos+self.width, self.ypos+self.proj_size/2, self.proj_size, self.proj_speed)
    table.insert(self.shots, bullet)
    cooldown = self.fire_rate
end

function Player.drawShots(self)
    for i,v in ipairs(self.shots) do
        self.shots[i]:draw()
    end
end

function Player.updateShots(self)
    for i,v in ipairs(self.shots) do
        self.shots[i]:update()
    end
end

return Player
