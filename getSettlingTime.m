%{
Gets the setteling time for a certain friction and acceleration constant
related to a specific system.
%}
function settlingTime = getSettlingTime(startPosition, targetPosition, frictionConstant, accelerationConstant, dt, timeEnd, stableFraction)
    stableTimeRequired = 10;% The time a system needs to stay below the fraction from the target value to be considered stable.
    
    for time = 0:dt:timeEnd
        currentPosition = differentialEquationSolution(time, startPosition, targetPosition, frictionConstant, accelerationConstant);
        if abs(startPosition - targetPosition) * stableFraction > abs(targetPosition - currentPosition)
            stableTime = stableTime + dt;
        else
            stableTime = 0;
        end
        
        if stableTime > stableTimeRequired
            break
        end
    end
    
    settlingTime = time - stableTime;