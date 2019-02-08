%{
A function to calculate the total acceleration of the ball.
%}
function accelerationTotal = calAccelerationTotal(distance, current, massBall)
    %%% Hardcoding some variables.
    
    accelerationTotal = (calForceGravity(massBall) + calForceMagnet(-distance, current)) / massBall;