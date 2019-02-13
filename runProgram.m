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
xlabel('Time')
ylabel('Position')