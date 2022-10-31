classdef V_aHO < Potential
    % Anharmonic oscillator potential (subclass of Potential)
    
    properties
        k_osc (1,1) double {mustBePositive} = 1/2;
    end

    methods

        function obj = V_aHO()
            obj.V_string = 'Anharmonic Oscillator';
        end

        function outputArg = V(obj,x)
            % anharmonic oscillator potential for particle at x
            outputArg = obj.k_osc .* x.^4 ./2;
        end

    end
end