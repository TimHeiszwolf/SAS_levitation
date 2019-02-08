function forceParticular =  calFp(distance, lengthWire, current)
    %%% Hardcoding some variables of the permanent magenet.
    % See : https://www.supermagnete.de/eng/faq/How-do-you-calculate-the-magnetic-flux-density
    % All are in SI base units.
    % All values are currently just a guestimate
    remanenceBField = 1.3;
    tickness = sign(distance)*0.0075;
    radius = 0.0075/2;
    
    part1 = (tickness + distance) / ((radius^2 + (distance + tickness)^2)^0.5);
    part2 = -distance / ((distance^2 + radius^2)^0.5);
    forceParticular = 0.5 * lengthWire * current * remanenceBField * (part1 + part2);