%{
A function which simulates the motion of the ball acourding to certain
parameters.
%}
function outputData = simulationMotion(dt, timeEnd, startPosition, targetPosition, startVelocity, massBall, frictionConstant, accelerationConstant)
    %%% Getting started.
    tick = 0;
    data = zeros(int32(timeEnd/dt), 5);
    position = startPosition;
    velocity = startVelocity;
    data(1, 2) = startPosition;
    data(1, 3) = startVelocity;

    %%% Doing the actual simulation.
    while tick<=timeEnd/dt
        tick = tick+1;
        oldPosition = position;
        oldVelocity = velocity;
        current = getStablizingCurrent(oldPosition, oldVelocity, targetPosition, massBall, frictionConstant, accelerationConstant);
        
        %%% Calculating the effects of this tick on the kinimatics of the ball.
        acceleration = calAccelerationTotal(position, current, massBall);
        velocity = oldVelocity + acceleration * dt;
        position = oldPosition + oldVelocity * dt + 0.5*acceleration*dt^2;
        
        %%% Assiging the data of the tick to the (empty) data matrix/array.
        data(tick, 1) = tick*dt;
        data(tick, 2) = position;
        data(tick, 3) = velocity;
        data(tick, 4) = calForceMagnet(-oldPosition, current);
        data(tick, 5) = current;

    end
    
    outputData = data;