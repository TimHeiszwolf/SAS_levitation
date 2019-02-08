%{
A function to calculate the gravity of the ball. Takes the mass of the ball
and returns a negative number.
%}
function forceGravity = calForceGravity(mass)
    %%% Hardcoding some variables.
    g = -9.81;
    
    forceGravity = mass * g;