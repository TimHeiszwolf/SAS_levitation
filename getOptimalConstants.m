%%% Some settings of the simulation
dt = 0.001;% Steps in time of the simulation.
timeEnd = 150;% End time of the simulation.
startPosition = -0.01;% Starting position of the ball.
targetPosition = -0.04;% Target position of the ball.
startVelocity = 0.0;% Startin velocity of the ball.
fraction=1/5;
raSteps=0.001;
raEnd=2;
stableTimeRequired=10;
massBall = 0.019;% The mass of the ball.
accelerationConstant = 1;% The amount of acceleration to reach the target.

bestTime=timeEnd;
bestFraction=0;
for tick = 0:(raEnd/raSteps)
    ra=tick*raSteps;
    stableTime=0;
    for time = 0:dt:timeEnd
        if abs(startPosition-targetPosition)*fraction>abs(targetPosition-differentialEquationSolution(time, startPosition, targetPosition, ra * accelerationConstant, accelerationConstant))
            stableTime=stableTime+dt;
        else
            stableTime=0;
        end
        
        if stableTime>stableTimeRequired&&(time-stableTime)<bestTime
            %{
            disp(abs(startPosition-targetPosition)*fraction)
            disp(abs(targetPosition-differentialEquationSolution(time, startPosition, targetPosition, ra * accelerationConstant, accelerationConstant)))
            disp(time-stableTime)
            disp(ra)
            %}
            bestTime=time-stableTime;
            bestFraction=ra;
            break
        end
    end
end