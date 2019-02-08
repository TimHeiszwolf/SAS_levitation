%{
A function to get the current needed for stablizing the ball. It first
calculates the needed acceleration and then uses a other function to get
the current.
%}
function neededCurrent = getStablizingCurrent(distance, velocity, target, massBall)
    %%% Hardcoding some stuff
    frictionConstant = 1;% The amount of friction (acceleration counteracting the velocity) which prevents large ocilations and makes the system stable.
    accelerationConstant = 1;% The amount of acceleration to reach the target.
    
    acceleration = accelerationConstant*(target-distance) - frictionConstant * velocity;
    neededCurrent = getCurrentAcceleration(distance, acceleration, massBall);