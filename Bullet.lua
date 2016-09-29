local Bullet = {}

function Bullet.new(self, xarg, yarg, sizearg, speedarg)
    self.xpos = xarg
    self.ypos = yarg
    self.size = sizearg
    self.speed = speedarg
    self.type = "auto"

    local instance = {}

    for key,value in pairs(Bullet) do
        instance[key] = value
    end

    return instance
end

function Bullet.draw(self)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill",self.xpos, self.ypos, self.size, self.size) -- gonna have to rethink this, should be handled in Bullet.lua
end

function Bullet.update(self)
    if self.type == "auto" or type == "pierce" then
        self.xpos = self.xpos + self.speed * love.timer.getDelta()
    end

    if self.type == "lob" then
            --math
    end
end

return Bullet
