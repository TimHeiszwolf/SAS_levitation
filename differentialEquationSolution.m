%{
A function which calculates the analytical solution to the differential
equation made by the getStablizingCurrent function.
%}
function distance = differentialEquationSolution(time, startPosition, targetPosition, frictionConstant, accelerationConstant)
    r1 = 0.5 * (((frictionConstant)^2 - (4 * accelerationConstant))^0.5 - frictionConstant);
    r2 = 0.5 * (-((frictionConstant)^2 - (4 * accelerationConstant ))^0.5 - frictionConstant);
    A = (startPosition - targetPosition) * (1 + (r1 / (r2 - r1)));
    B = -(startPosition - targetPosition) * (r1 / (r2 - r1));
    
    distance = A * exp(r1 * time) + B * exp(r2 * time) + targetPosition;
    