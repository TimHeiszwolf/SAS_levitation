function force =  calF(distance, current)
    %%% Hardcoding aspects of the coil
    oneWireLength = 6 * 4.0 / 100;
    loops = 64;
    height = 7.0/100;
    
    %%% Seting variables.
    totalForce = 0; %Used to iterate upon.
    
    for i = 0:loops %Adding the force from the coil.
        totalForce = totalForce + calFp(distance + height * i / loops, oneWireLength, current);
    end
    
    force = totalForce;