classdef PathIntegral
    %A class for a path integral for 1D quantum mechanics. Associated with
    %an instance of the class is:
    %   a potential with the potential superclass but a particulart
    %   subclass
    %   a lattice definition
    %   settings for correlation and thermalization "times" (Monte Carlo
    %   steps) 
    %   method for updating
    %   method for averaging
    %   list of configurations (paths)
    %   choice of by-hand Metropolis updating or using emcee, zeus, or
    %   pyMC3

    properties
        Delta_T (1,1) double {mustBePositive} = 0.25;
        N_pts (1,1) double {mustBePositive} = 20;
        N_config (1,1) double {mustBePositive} = 100;
        N_corr (1,1) double {mustBePositive} = 20;
        eps (1,1) double {mustBePositive} = 1.4;

        V_pot = V_HO; % default potential: harmonic oscillator
        T_max;

    end

    methods

        function obj = PathIntegral(varargin)
            if nargin == 6
                obj.Delta_T = varargin{1};
                obj.N_pts = varargin{2};
                obj.N_config = varargin{3};
                obj.N_corr = varargin{4};
                obj.eps= varargin{5};
                obj.V_pot = varargin{6};
                obj.T_max = obj.N_pts * obj.Delta_T;
            elseif nargin ==0
                obj.T_max = obj.N_pts * obj.Delta_T;
                return
            else
                error("PathIntegral constructor takes in either 0 or 6 inputs.")
            end        
        end

        function lattice_action = S_lattice(obj,x_path)
            %Lattice Action
            % Contribution to the action from path x_path

            x = x_path(1:end-1);
            x_plus = x_path(2:end);

            lattice_action = sum (obj.Delta_T .* obj.V_pot.V(x) + ...
                (obj.V_pot.mu/(2*obj.Delta_T)) .* (x_plus-x).^2);

        end
        
        function avg = E_avg_over_paths(obj,list_of_paths)
            x = list_of_paths(:,1:end-1);
            x_plus = list_of_paths(:,2:end);

            tot = sum(sum (obj.Delta_T .* obj.V_pot.V(x) + ...
                (obj.V_pot.mu/(2*obj.Delta_T)) .* (x_plus-x).^2));
            avg = tot / numel(list_of_paths);

        end
%         
%         function OutputArg = H_lattice_j(obj,x_path, j)
%             %Contribution to the energy from time point j
%             if j >= obj.N_pts
%                 j = 1;
%             end
% 
% 
%         end
%            
%         function outputarg2 = E_avg_over_paths(obj,list_of_paths)
%             %Average the lattice Hamiltonian over a set of configurations
%             %in list_of_paths which is a CELL arrary
%             N_paths = length(list_of_paths);
%             
%         end
    end















end