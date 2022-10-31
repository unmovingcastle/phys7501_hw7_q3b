classdef V_lin < Potential
    % linear potential (subclass of Potential)
    
    properties
        k_osc (1,1) double {mustBePositive} = 1/2;
    end

    methods

        function obj = V_lin()
            obj.V_string = 'Linear Potential';
        end

        function outputArg = V(obj,x)
            outputArg = obj.k_osc .* abs(x);
        end

    end
end