%{
A function to get the current needed for stablelizing the ball
%}
function neededCurrent = getStablizingCurrent(distance, velocity, target, massBall)
    %%% Hardcoding some stuff
    frictionConstant = 1;
    accelerationConstant = 1;
    
    acceleration = accelerationConstant*(target-distance) - frictionConstant * velocity;
    disp(acceleration)
    
    neededCurrent = getCurrentAcceleration(distance, acceleration, massBall);
    disp(calAccelerationTotal(distance, neededCurrent, massBall))