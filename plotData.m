%{
A function which plots the data made by the function simulationMotion. The
first column is the time data, the second is position, the third is
velocity, after that some data related to the magnet is also ploted such as
the force of it and the current. A graph with all data in it is also made
but this is quite useless.
%}
function plotData(data)
    figure
    plot(data(:,1), data(:,2))
    title('Numerical position against time')
    xlabel('Time')
    ylabel('Position')
    
    figure
    plot(data(:,1), data(:,3))
    title('Numerical velocity against time')
    xlabel('Time')
    ylabel('Velocity')

    figure
    plot(data(:,1), data(:,4))
    title('Force of the magnet/coil against time')
    xlabel('Time')
    ylabel('Force magnet')

    figure
    plot(data(:,1), data(:,5))
    title('Required current trough the coil against time')
    xlabel('Time')
    ylabel('Current')