%%% Some settings of the simulation
dt = 0.001;% Steps in time of the simulation.
timeEnd = 15;% End time of the simulation.
startPosition = -0.01;% Starting position of the ball.
targetPosition = -0.04;% Target position of the ball.
startVelocity = 0.0;% Startin velocity of the ball.
massBall = 0.019;% The mass of the ball.
frictionConstant = 1;% The amount of friction (acceleration counteracting the velocity) which prevents large ocilations and makes the system stable.
accelerationConstant = 1;% The amount of acceleration to reach the target.

%%% Using the numerical method.
data = simulationMotion(dt, timeEnd, startPosition, targetPosition, startVelocity, massBall, frictionConstant, accelerationConstant);
plotData(data)

%%% Using the differential equation (doesn't take into account the starting velocity).
time = 0:dt:timeEnd;
distance = differentialEquationSolution(time, startPosition, targetPosition, frictionConstant, accelerationConstant);
figure
plot(time, distance)
title('Analytical position against time')
xlabel('Time')
ylabel('Position')

%%% Determining optimal constants
stableFraction = 1/5;% The fraction of the target value that needs to be reached before the system is stable.
timeEnd = 200;% The maximum time for determining stability.
accelerationConstantSteps = 0.05;% The steps in the acceleration constant.
accelerationConstantEnd = 2;% The maximim value of the acceleration constant.

currentOptimalFrictionConstant = getOptimalConstants(startPosition, targetPosition, stableFraction, accelerationConstant, dt, timeEnd);

accelerationConstantVector = 0:accelerationConstantSteps:accelerationConstantEnd;
optimalFrictionConstantVector = arrayfun(@(x) getOptimalConstants(startPosition, targetPosition, stableFraction, x, dt, timeEnd), accelerationConstantVector);

figure
plot(accelerationConstantVector, optimalFrictionConstantVector)
title('Optimal friction constant against acceleration constant')
xlabel('Acceleration constant')
ylabel('Optimal friction constant')
