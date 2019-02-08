%%% Some settings of the simulation
dt = 0.01;% Steps in time of the simulation.
timeEnd = 15;% End time of the simulation.
startPosition = -0.01;% Starting position of the ball.
targetPosition = -0.07;% Target position of the ball.
startVelocity = 0.0;% Startin velocity of the ball.
massBall = 0.019;% The mass of the ball.

%%% Getting started.
tick = 0;
data = zeros(int32(timeEnd/dt), 5);
position = startPosition;
velocity = startVelocity;
data(1, 2) = startPosition;
data(1, 3) = startVelocity;

%%% Doing the actual simulation.
while tick<=timeEnd/dt
    tick = tick+1;
    oldPosition = position;
    oldVelocity = velocity;
    current = getStablizingCurrent(oldPosition, oldVelocity, targetPosition, massBall);
    
    acceleration = calAccelerationTotal(position, current, massBall);
    
    velocity = oldVelocity + acceleration * dt;
    position = oldPosition + oldVelocity * dt + 0.5*acceleration*dt^2;
    
    data(tick, 1) = tick*dt;
    data(tick, 2) = position;
    data(tick, 3) = velocity;
    data(tick, 4) = calForceMagnet(-oldPosition, current);
    data(tick, 5) = current;
    
end

plot(data(:,1), data(:,2))
xlabel('Time')
ylabel('Position')

figure
plot(data(:,1), data(:,3))
xlabel('Time')
ylabel('Velocity')

figure
plot(data(:,1), data(:,4))
xlabel('Time')
ylabel('Force magnet')

figure
plot(data(:,1), data(:,5))
xlabel('Time')
ylabel('Current')

figure
plot(data(:,1), [data(:,2) data(:,3) data(:,4)])
xlabel('time')