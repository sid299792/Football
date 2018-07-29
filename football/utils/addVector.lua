function addVector(speed,angle,speed2,angle2,dt)
    x = math.sin(angle)*speed + math.sin(angle2)*speed2*dt
    y = math.cos(angle)*speed + math.cos(angle2)*speed2*dt
    v = (x*x + y*y)^(1/2)
    a = math.pi/2 - math.atan(y,x)
    return v,a
end

return addVector