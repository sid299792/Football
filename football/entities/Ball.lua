local Class = require 'libs.hump.class'
local HC = require 'libs.HC'
local addVector = require 'utils.addVector'

local Ball = Class{}

function Ball:init(x,y,r,speed,angle)
    self.x = x
    self.y = y
    self.r = r
    self.body =  HC.circle(x,y,r)
    self.speed = speed
    self.angle = angle
end

function Ball:update(dt)
    local g = 100
    dx = math.sin(self.angle)*self.speed*dt
    dy = -math.cos(self.angle)*self.speed*dt
    self.speed,self.angle = addVector(self.speed,self.angle,g,math.pi,dt)
    self.body:move(dx,dy)
    self.x = self.x + dx
    self.y = self.y + dy
    if self.x - self.r < 0 then
        self.x = self.r
        self.angle = -self.angle
    elseif self.x + self.r > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.r
        self.angle = -self.angle
    end
end

function Ball:bounce(direction,other)
    if direction == 'down' then
        self.angle = math.pi - self.angle
    end
end

function Ball:draw()
    love.graphics.setColor(0,0,255,128)
    love.graphics.circle('fill',math.floor(self.x+0.5),math.floor(self.y+0.5),self.r)
end
return Ball


        


