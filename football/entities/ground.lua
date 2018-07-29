local Class = require 'libs.hump.class'
local HC = require 'libs.HC'

local Ground = Class{
    __includes = Entity
}

function Ground:init(x,y,w,h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.body = HC.rectangle(x,y,w,h)
end

function Ground:update(dt)

end

function Ground:draw()
    love.graphics.rectangle('fill',self.x,self.y,self.w,self.h)
end

return Ground
