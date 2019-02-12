%{
A function to get the current needed for stablizing the ball. It first
calculates the needed acceleration and then uses a other function to get
the current. It calculates the needed acceleration based on the distance to
the target and a 'friction' part which prevents the ball from never
stabelizing.
%}
function neededCurrent = getStablizingCurrent(distance, velocity, target, massBall, frictionConstant, accelerationConstant)
    acceleration = accelerationConstant*(target-distance) - frictionConstant * velocity;
    neededCurrent = getCurrentAcceleration(distance, acceleration, massBall);