classdef V_quartic < Potential
    % quartic potential (subclass of Potential)
    
    properties
        k_osc (1,1) double {mustBePositive} = 1/2;
    end

    methods

        function obj = V_quartic()
            obj.V_string = 'Quartic Potential';
        end

        function outputArg = V(obj,x)
            outputArg = obj.k_osc .* x.^4 ./4;
        end

    end
end