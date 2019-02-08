%{
A function to calculate the total acceleration of the ball.
%}
function accelerationTotal = calAccelerationTotal(distance, current)
    %%% Hardcoding some variables.
    massBall = 0.019;
    
    accelerationTotal = (calForceGravity(massBall) + calForceMagnet(distance, current)) / massBall;