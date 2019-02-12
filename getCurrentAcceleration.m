%{
A function the determines the needed current to get a certain acceleration.
%}
function current = getCurrentAcceleration(distance, acceleration, massBall)
    %%% Hardcoding some variables
    g = -9.81;
    coilConstant = 1.36 * 10^-3;% Not yet measured just taken from the sylabus.
    metalConstant = 7.14 * 10^-4;% Not yet measured just taken from the sylabus.
    
    current = ((acceleration - g) * massBall * abs(distance) - metalConstant) / coilConstant;