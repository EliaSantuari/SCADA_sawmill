

n_m = 1; % n_macchina

assi_true = out.assi_instant.Data;
assi_est = squeeze(out.n_assi_stim.Data);
assi_est = permute(assi_est, [2, 1]);

assi_true = assi_true(:, n_m);
assi_true = assi_true(find(assi_true));
assi_est = assi_est(:, n_m);
assi_est = assi_est(find(assi_est));

figure
plot(assi_est, 'LineWidth',2, 'Color','g')
hold on
plot(assi_true, 'LineWidth',2, 'LineStyle','--', 'Color','k')
legend('Estimated Number of Boards', 'Actual Number of Boards')
title(['Comparison between actual and estimated number of boards of machine ', num2str(n_m+1)])
ylabel('Number of boards')
xlabel('Boards production batch')
grid on





% likelihood = out.likelihood.Data(:, n_m, :);
% prior = out.prior.Data(:, n_m, :);
% true = out.assi_instant.Data(:, n_m);
% n_assi_stim = out.n_assiim;









% 
% non_nulle_posterior = any(posterior, [1 2]);
% non_nulle_likelihood = any(likelihood, [1 2]);
% non_nulle_prior = any(prior, [1 2]);
% non_nulle_true = true(:, 1) ~= 0;
% 
% 
% 
% % Steps in cui ho dei valori
% posterior = posterior(:, :, non_nulle_posterior);
% likelihood = likelihood(:, :, non_nulle_likelihood);
% prior = prior(:, :, non_nulle_prior);
% true = true(non_nulle_true);
% 
% % figure()
% % plot(posterior(:, :, 1) ,Color="red", LineWidth=2)
% % grid on;
% % hold on;
% % plot(likelihood(:, :, 1), Color="blue")
% % plot(prior(:, :, 1), Color="green" , LineWidth=1)
% % xline(true(1), LineWidth=2)
% % legend("Posterior", "Likelihood", "Prior")
% 
% 
% assi = (1:size(posterior,1))'; % possibili valori
% 
% E_post = round(squeeze(sum(posterior .* assi, 1)));
% E_like = squeeze(sum(likelihood .* assi, 1));
% E_prior = squeeze(sum(prior .* assi, 1));
% 
% 
% 
% figure(1000)
% hold on;
% plot(E_like, 'b');
% % plot(E_prior, 'g', 'LineWidth', 2); 
% % plot(E_post, 'r', 'LineWidth', 2);
% plot(true, 'k--', 'LineWidth', 2);
% legend("Likelihood", "Prior", "Posterior", "True")
% xlabel("Time step")
% ylabel("Numero assi stimato")
% grid on
% hold off;
% 
% 
% 
% % figure()
% % clf
% % t = 5;
% % plot(posterior(:,1,t), 'g', 'LineWidth', 2); hold on;
% % plot(likelihood(:,1,t), 'b');
% % plot(prior(:,1,t), 'r');
% % xline(true(t), 'k--', 'LineWidth', 2);
% % xlabel("Number of boards [n]")
% % ylabel("Probability distribution")
% % title(['Board output: ', num2str(t)])
% % legend("Posterior", "Likelihood", "Prior", "True")
% % ylim([0 1])
% % grid on
% % pause(1)
