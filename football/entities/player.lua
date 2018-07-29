local Class = require 'libs.hump.class'
local HC = require 'libs.HC'
local addVector = require 'utils.addVector'

Player = Class{}

function Player:init(x,y)
    self.img = love.graphics.newImage('/assets/player.png')
    self.body = HC.rectangle(x,y,self.img:getWidth(),self.img:getHeight())
    self.x = x
    self.y = y
    self.speed = 0
    self.angle = 0
    self.rotation = 0
    self.onGround = false
end

function Player:update(dt)
    dx = math.sin(self.angle)*self.speed*dt
    dy = -math.cos(self.angle)*self.speed*dt
    self.body:move(dx,dy)
    self.x = self.x + dx
    self.y = self.y + dy
    if not self.onGround then
        self.speed,self.angle = addVector(self.speed,self.angle,100,math.pi,dt)
    end
    if self.onGround then
        if love.keyboard.isDown('w','up') then
            self.speed = 100
            self.angle = 0
            self.onGround = false
        elseif love.keyboard.isDown('a','left') then
            self.speed = 60
            self.angle = -math.pi/2
        elseif love.keyboard.isDown('d','right') then
            self.speed = 60
            self.angle = math.pi/2
        end
    end
end
function Player:reach_ground(other)
    self.y = other.y - self.img:getHeight()
    self.body:moveTo(self.x,self.y)
    self.onGround = true
    print(other.y)
end
function Player:draw()
    love.graphics.rectangle('fill',self.x,self.y,self.img:getWidth(),self.img:getHeight())
end
return Player
        
    