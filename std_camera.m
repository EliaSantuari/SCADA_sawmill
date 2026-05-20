z_cam = 20;

%% GENERO MISURE CON MODELLO DISCRETO
n = 1000000;
noise_disc_hist = zeros(n,1);
z_cam_disc = zeros(n,1);

for i = 1:n
    if rand < 0.03
        if rand < 0.7
            noise = -2;
        else 
            noise = 2;
        end

    elseif rand < 0.1
        if rand < 0.7
            noise = -1;
        else
            noise = 1;
        end

    else
        noise = 0;

    end
    noise_disc_hist(i) = noise;
    z_cam_disc(i) = z_cam + noise;
end

%% GENERO MISURE CON MODELLO GAUSSIANO
k = 0.05;
noise_gauss_hist = zeros(n,1);
z_cam_gauss = zeros(n,1);
for i = 1:n
    noise_gauss = k*z_cam * randn();
    noise_gauss_hist(i) = noise_gauss;
    z_cam_gauss(i) = z_cam + noise_gauss;
end

%% CONFRONTO

% Mean
mean_disc = mean(noise_disc_hist);
mean_gauss = mean(noise_gauss_hist);

% STD
std_disc = std(noise_disc_hist);
std_gauss = std(noise_gauss_hist);


% Display results
fprintf('\n================ DISCRETE MODEL ================\n');
fprintf('Mean error          = %.4f boards\n', mean_disc);
fprintf('Standard deviation  = %.4f boards\n', std_disc);
fprintf('\n================ GAUSSIAN MODEL ================\n');
fprintf('Mean error          = %.4f boards\n', mean_gauss);
fprintf('Standard deviation  = %.4f boards\n', std_gauss);


figure;
histogram(noise_disc_hist, 'Normalization', 'pdf');
hold on;
histogram(noise_gauss_hist, 30, 'Normalization', 'pdf');
xlabel('Error [boards]');
ylabel('Probability density');
title('Discrete vs Gaussian Approximation');
legend('Discrete model', 'Gaussian model');
grid on;