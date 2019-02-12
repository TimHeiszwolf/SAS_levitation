%{
A function to calculate the total acceleration of the ball.
%}
function accelerationTotal = calAccelerationTotal(distance, current, massBall)
    accelerationTotal = (calForceGravity(massBall) + calForceMagnet(-distance, current)) / massBall;