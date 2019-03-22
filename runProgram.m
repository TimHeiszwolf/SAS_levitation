%%% Some settings of the simulation
dt = 0.001;% Steps in time of the simulation.
timeEnd = 10;% End time of the simulation.
startPosition = -0.03;% Starting position of the ball.
targetPosition = -0.021;% Target position of the ball.
startVelocity = 0.0;% Startin velocity of the ball.
massBall = 0.019;% The mass of the ball.
accelerationConstant = 1.5;% The amount of acceleration to reach the target.
frictionConstant = 1.695;% The amount of friction (acceleration counteracting the velocity) which prevents large ocilations and makes the system stable.
randomChance = 0.1;% The chance per second that a random infulence ocours
randomChanceMagnitude = 0.02;% The magnitude in meters per second of a random influence.

%%% Using the numerical method.
data = simulationMotion(dt, timeEnd, startPosition, targetPosition, startVelocity, massBall, frictionConstant, accelerationConstant, randomChance, randomChanceMagnitude);
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
stableFraction = 1/20;% The fraction of the target value that needs to be reached before the system is stable.
timeEnd = 1000;% The maximum time for determining stability.
accelerationConstantSteps = 0.05;% The steps in the acceleration constant.
accelerationConstantEnd = 2;% The maximim value of the acceleration constant.
raSteps = 0.01;% The steps in the ratio.
raEnd = 2;% The maximum of the ratio the friction constant with respect to the acceleration constant
ra = 0:raSteps:raEnd;
frictionConstants = ra * accelerationConstant;


currentSettlingTime = getSettlingTime(startPosition, targetPosition, frictionConstant, accelerationConstant, dt, timeEnd, stableFraction)% Getting the settling time with the current setup.
if startPosition > targetPosition
    [temp, tick] = min(distance);% Determining the overshoot and peaktime
else
    [temp, tick] = max(distance);
end
overshoot = temp - targetPosition
peaktime = tick * dt

currentOptimalFrictionConstant = getOptimalConstants(startPosition, targetPosition, stableFraction, accelerationConstant, dt, timeEnd)
settlingTimes = arrayfun(@(x) getSettlingTime(startPosition, targetPosition, x, accelerationConstant, dt, timeEnd, stableFraction), frictionConstants);
figure
plot(frictionConstants, settlingTimes)% Plotting the settling times as a function of the friction constant with the current acceleration constant.
axis([0.0 4.0 0.0 10.0])
title('Settling time against the frictionconstant (with constant acceleration constant)')
xlabel('Friction constant')
ylabel('Settling time')

accelerationConstantVector = 0:accelerationConstantSteps:accelerationConstantEnd;
optimalFrictionConstantVector = arrayfun(@(x) getOptimalConstants(startPosition, targetPosition, stableFraction, x, dt, timeEnd), accelerationConstantVector);

figure
plot(accelerationConstantVector, optimalFrictionConstantVector)% Plotting the optimal friction constant as a function of the acceleration constant. For small fractions and non-small acceleration constants should look like 2 times the squareroot of the acceleration constant.
title('Optimal friction constant against acceleration constant')
xlabel('Acceleration constant')
ylabel('Optimal friction constant')