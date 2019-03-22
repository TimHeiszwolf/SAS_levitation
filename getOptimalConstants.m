%{
Gets the optimal constant for the friction constant as a function of the
acceleration constant (and the other parameters related to the simulation)
using the differential equation.
%}
function optimalConstant = getOptimalConstants(startPosition, targetPosition, stableFraction, accelerationConstant, dt, timeEnd)
    raSteps = 0.01;% The steps in the ratio.
    raEnd = 2;% The maximum of the ratio the friction constant with respect to the acceleration constant.
    
    ra = 0:raSteps:raEnd;
    frictionConstant = ra * accelerationConstant;
    [settlingTime, frictionConstantIndex] = min(arrayfun(@(x) getSettlingTime(startPosition, targetPosition, x, accelerationConstant, dt, timeEnd, stableFraction), frictionConstant));
    optimalConstant = frictionConstant(frictionConstantIndex);