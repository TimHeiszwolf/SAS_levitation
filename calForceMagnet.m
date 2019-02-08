%{
A function to calculate the force of the magnet on the ball from sylabus
(Jan van Dijk version 2016/2017 -- draft). Takes the distance from the top
of the ball to magnet/coil and the current flowing to trough the coil.
Returns a positive number if the magnet/coil is above the ball and a
negative number if it is below the ball.
%}
function forceMagnet = calForceMagnet (distance, current)
    %%% Hardcoding some variables of the coil magnet pair.
    coilConstant = 1.36 * 10^-3;% Not yet measured just taken from the sylabus.
    metalConstant = 7.14 * 10^-4;% Not yet measured just taken from the sylabus.
    
    forceMagnet = (coilConstant * current + metalConstant) / abs(distance);