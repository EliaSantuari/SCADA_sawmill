%% Stima Larghezza Assi M1 L1

posterior_m1 = out.posterior_m1.Data;
likelihood_m1 = out.likelihood_m1.Data;
prior_m1 = out.prior_m1.Data;
true_m1 = out.true_larg_m1.Data;

larg_m1 = (0:size(posterior_m1,2)-1); % possibili valori

E_post_m1 = squeeze(sum(posterior_m1 .* larg_m1, 2));
E_like_m1 = squeeze(sum(likelihood_m1 .* larg_m1, 2));
E_prior_m1 = squeeze(sum(prior_m1 .* larg_m1, 2));

t = (1:length(E_post_m1))*dT;

figure
hold on;
plot(t, E_like_m1, 'b');
plot(t, E_post_m1, 'g');
plot(t, E_prior_m1, 'r','LineWidth', 2)
plot(t, true_m1, 'k--', 'LineWidth', 2);
legend("Likelihood", "Posterior", "Prior", "True")
xlabel("Time (s)")
ylabel("Plank width [mm]")
title("Estimate comparison of the plank width for line 1")
grid on
hold off;



%% Stima Larghezza Assi M1 L2

posterior_m4 = out.posterior_m4.Data;
likelihood_m4 = out.likelihood_m4.Data;
prior_m4 = out.prior_m4.Data;
true_m4 = out.true_larg_m4.Data;

larg_m4 = (0:size(posterior_m4,2)-1); % possibili valori

E_post_m4 = squeeze(sum(posterior_m4 .* larg_m4, 2));
E_like_m4 = squeeze(sum(likelihood_m4 .* larg_m4, 2));
E_prior_m4 = squeeze(sum(prior_m4 .* larg_m4, 2));

figure
hold on;
plot(t, E_like_m4, 'b'); 
plot(t, E_post_m4, 'g');
plot(t, E_prior_m4, 'r', 'LineWidth', 2);
plot(t, true_m4, 'k--', 'LineWidth', 2);
legend("Likelihood", "Posterior", "Prior", "True")
xlabel("Time (s)")
ylabel("Plank width [mm]")
grid on
hold off;



%% Stima Larghezza Assi M1 L3

posterior_m7 = out.posterior_m7.Data;
likelihood_m7 = out.likelihood_m7.Data;
prior_m7 = out.prior_m7.Data;
true_m7 = out.true_larg_m7.Data;

larg_m7 = (0:size(posterior_m7,2)-1); % possibili valori

E_post_m7 = squeeze(sum(posterior_m7 .* larg_m7, 2));
E_like_m7 = squeeze(sum(likelihood_m7 .* larg_m7, 2));
E_prior_m7 = squeeze(sum(prior_m7 .* larg_m7, 2));

figure
hold on;
plot(t, E_like_m7, 'b'); 
plot(t, E_post_m7, 'g');
plot(t, E_prior_m7, 'r','LineWidth', 2);
plot(t, true_m7, 'k--', 'LineWidth', 2);
legend("Likelihood", "Posterior","Prior", "True")
xlabel("Time (s)")
ylabel("Plank width [mm]")
grid on
hold off;


