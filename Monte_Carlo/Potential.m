classdef Potential
    % A general class for nonrelativistic one-dimensional potentials
    %
    %   Parameters
    %   ----------
    %   hbar : float
    %       Planck's constant. Equals 1 by default
    %
    %   mu : float
    %       Reduced mass. Equals 1 by default
    % 
    %   Methods
    %   -------
    %   V(x)
    %       Returns the value of the potential at x.
    %
    %   E_gs
    %       Returns the analytic ground-state energy, if known      
    %
    %   wf_gs(x)
    %       Returns the analytic ground-state wave function, if known
    %
    %   plot_V(ax, x_pts)
    %       Plots the potential at x_pts on ax


    properties
        hbar (1,1) double {mustBePositive} = 1;
        mu(1,1) double {mustBePositive} = 1;
        V_string='';
    end

    methods

        function V(~,~)
            disp('The potential is not defined.')
        end

        function E_gs(~)
            disp('The ground state energy is not known analytically.')
        end

        function wf_gs(~,~)
            disp('The ground state wave function is not known analytically.')
        end
        
%         function plot_V(obj, ax, x_pts, V_label)
% 
%             plot(x_pts,obj.V(x_pts),'displayname',V_label)
%         end
    end
end











