function love.load()
    Ball = require 'entities.Ball'
    Ground = require 'entities.ground'
    HC = require 'libs.HC'
    Player = require 'entities.player'
    player = Player(400,0)    
    ball = Ball(600,200,10,0,0)
    ground = Ground(0,400,love.graphics:getWidth(),love.graphics:getHeight())
    entities = {}
    table.insert(entities,ball)
    table.insert(entities,ground)
    table.insert(entities,player)

end
function love.update(dt)
    for i,entity in ipairs(entities) do
        entity:update(dt)
    end
    for shape,delta in pairs(HC.collisions(ball.body)) do
        if shape == ground.body then
            ball:bounce('down',ground)
        end
    end
    for shape,delta in pairs(HC.collisions(player.body)) do
        if shape == ground.body then
            player:reach_ground(ground)
        end
    end
end

function love.draw()
    for i,entity in ipairs(entities) do
        entity:draw()
    end
end

