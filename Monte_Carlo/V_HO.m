classdef V_HO < Potential
    % Harmonic oscillator potential (subclass of Potential)
    
    properties
        k_osc (1,1) double {mustBePositive} = 1/2;
    end

    methods

        function obj = V_HO()
            obj.V_string = 'Harmonic Oscillator';
        end

        function outputArg = V(obj,x)
            %standard harmonic oscillator potential for particle at x
            outputArg = obj.k_osc .* x.^2 ./2;
        end

        function outputArg2 =  E_gs(obj)
            % 1D harmonic oscillator ground-state energy
            outputArg2 = (1/2) * obj.hbar * sqrt(obj.k_osc ./ obj.mu);
        end

        function outputArg3 =  wf_gs(obj,x)
            % 1D harmonic oscillator ground-state wave function
            outputArg3 = exp(-x.^2./2) ./ pi.^(1/4);
        end

    end
end