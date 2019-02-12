%%% Some settings of the simulation
dt = 0.01;% Steps in time of the simulation.
timeEnd = 15;% End time of the simulation.
startPosition = -0.01;% Starting position of the ball.
targetPosition = -0.07;% Target position of the ball.
startVelocity = 0.0;% Startin velocity of the ball.
massBall = 0.019;% The mass of the ball.
frictionConstant = 1;% The amount of friction (acceleration counteracting the velocity) which prevents large ocilations and makes the system stable.
accelerationConstant = 1;% The amount of acceleration to reach the target.

data = simulationMotion(dt, timeEnd, startPosition, targetPosition, startVelocity, massBall, frictionConstant, accelerationConstant);

plotData(data)