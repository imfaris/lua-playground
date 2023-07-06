local speedLimit = 300
local margin = 10
local forceFactor = 0.01

local function setSpeedLimit()
    local car = ac.getCar(0)
    if car then
        local speedDifference = car.speedKmh - speedLimit
        if speedDifference > margin then
            local force = -car.velocity * (speedDifference - margin) * forceFactor
            physics.setCarVelocity(car, car.velocity + force)
        end
    end
end

function script.update(dt)
    setSpeedLimit()
end