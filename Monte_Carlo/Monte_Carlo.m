clear
clc

% test_ho = V_HO;
% test_aho = V_aHO;
% 
% x_pts_all = -4: 1e-2 :4;
% 
% f1 = figure(1);
% set(f1,'position',[400,200,800,600]);
% 
% plot(x_pts_all,test_ho.V(x_pts_all),'LineWidth',2)
% hold on;
% plot(x_pts_all,test_ho.wf_gs(x_pts_all),'LineWidth',2)
% legend('HO Potential', 'gs wf',"AutoUpdate",'off','fontsize',16)
% xlabel('$x$','interpreter','latex','fontsize',16)
% xlim([-4 4])
% ylim([-0.1 1])
% yline(0,':','LineWidth',2)
% title(test_ho.V_string + "with k_{osc} = " +...
%     num2str(test_ho.k_osc,'%.1f') + ", mass = " + ...
%     num2str(test_ho.mu,'%.1f') ,'fontsize',18)
% 
% % Normalization check of wave function squared
% format long
% trapz(x_pts_all,wf_gs(test_ho,x_pts_all).^2)


%% Test of emcee

Delta_T = 0.25;
N_pts = 20;
Tmax = Delta_T * N_pts;
N_corr = 20;

new_PI = PathIntegral();
% new_PI.V_pot = V_aHO;
new_PI.V_pot = V_lin;
%%

x_min = -5;
x_max = 5;
min_theta = x_min .* ones(N_pts,1);
max_theta = x_max .* ones(N_pts,1);
volume_theta = prod(max_theta-min_theta); % for normalization


log_prior = @(theta) log(1/volume_theta);
log_likelihood = @(theta) -new_PI.S_lattice(theta);
% log_posterior = @(theta) log_prior(theta)+log_likelihood(theta);


nwalkers = 50;
nsteps = 1e5; 

% start with a normal distribution with mean zero and width x_max/10
starting_guesses = (x_max/10) * randn(N_pts,nwalkers);


addpath("github_repo/")
[models,logP] = gwmcmc(starting_guesses,{log_prior log_likelihood},nsteps*nwalkers,'ThinChain',N_corr);

models(:,:,1:floor(size(models,3)*.2))=[]; %remove 20% as burn-in 
models = models(:,:)';

format long
new_PI.E_avg_over_paths(models)





