
data = out.Magazzino_log.Data;
time = out.Magazzino_log.Time;

% Per velocizzare animazione;
dTa = 10; 

[H_dim, L_dim, T] = size(data); 

[L_grid, H_grid] = meshgrid(l_index, h_index);

data_permuted = permute(data, [2, 1, 3]); 
data_flat = reshape(data_permuted, L_dim * H_dim, T); 

% Il target deve seguire lo stesso ordine dei bin
target_matrice_permuted = target_matrice'; % Trasposta per passare da [H x L] a [L x H]
target_flat = target_matrice_permuted(:); 

% Etichette nello stesso ordine
tick_labels = cell(1, H_dim * L_dim);
k = 1;
for i = 1:H_dim
    for j = 1:L_dim
        tick_labels{k} = sprintf('%d X %d', h_index(i), l_index(j));
        k = k + 1;
    end
end

% Preparazione animazione
data_flat_new = [data_flat, ones(size(data_flat,1), dTa) .* data_flat(:,end)];
time_new = [time; time(end)*ones(dTa,1)];

figure('Color', 'w', 'Position', [100, 100, 1000, 600]);
hBar = bar(data_flat_new(:,1)); 
grid on; hold on;

set(gca, 'XTick', 1:H_dim*L_dim, 'XTickLabel', tick_labels, 'XTickLabelRotation', 45, 'FontSize', 9);
hTarget = plot(1:H_dim*L_dim, target_flat, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Target');



ylim([0, max(target_flat) + 20]);
ylabel('Quantità Assi');
xlabel('Specifiche Sezione (Altezza H x Larghezza L)');
title('Monitoraggio Magazzino per Tipologia Prodotto');

% Colori 
color_working = [0 0.447 0.741]; 
color_finished = [0.466 0.674 0.188]; 

% Animazione
for t = 1:dTa:length(time_new)
    current_vals = data_flat_new(:,t);
    set(hBar, 'YData', current_vals);
    
    colors = repmat(color_working, H_dim*L_dim, 1);
    idx_target_reached = current_vals >= target_flat;
    colors(idx_target_reached, :) = repmat(color_finished, sum(idx_target_reached), 1);
    
    set(hBar, 'FaceColor', 'flat', 'CData', colors);
    title(['Warehouse state at time: ', num2str(time_new(t), '%.1f'), ' s']);
    ylabel('Number of produced planks [n]');
    xlabel('Plank section [height x width]')
    drawnow limitrate;
end

