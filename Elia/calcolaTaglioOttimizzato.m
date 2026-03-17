function [T, statistiche] = calcolaTaglioCompleto(D, L_tronco, sp_master, sp_recupero, lama, min_L_master)
    % D: Diametro (mm), L_tronco: Lunghezza (mm)
    % sp_master, sp_recupero, lama, min_L_master: (mm)

    R = D / 2;
    V_tronco = (pi * R^2 * L_tronco) / 1e6; % Volume cilindro in dm^3 (litri)
    
    % --- LOGICA DI POSIZIONAMENTO (Simmetrica) ---
    posizioni = []; spessori = []; tipi = [];
    
    % Assi Master
    p = sp_master / 2;
    while p < R
        if 2 * sqrt(R^2 - p^2) >= min_L_master
            posizioni = [posizioni, p];
            spessori = [spessori, sp_master];
            tipi = [tipi, 1]; % 1 = Master
            p = p + sp_master + lama;
        else, break; 
        end
    end
    
    % Specchiatura Master
    pos_m = [-fliplr(posizioni), posizioni];
    sp_m = [fliplr(spessori), spessori];
    tip_m = [repmat({'Master'}, 1, length(pos_m))];
    
    % Assi Recupero (sopra e sotto)
    limite = max(pos_m) + (sp_master/2) + lama;
    p_r = limite + (sp_recupero/2);
    pos_r_lato = [];
    while p_r < (R - 2)
        if 2 * sqrt(R^2 - p_r^2) > 20 % Minimo 2cm larghezza
            pos_r_lato = [pos_r_lato, p_r];
            p_r = p_r + sp_recupero + lama;
        else, break; end
    end
    
    % Unione finale
    tutte_pos = [-fliplr(pos_r_lato), pos_m, pos_r_lato];
    tutti_sp = [repmat(sp_recupero, 1, length(pos_r_lato)), sp_m, repmat(sp_recupero, 1, length(pos_r_lato))];
    tutti_tipi = [repmat({'Recupero'}, 1, length(pos_r_lato)), tip_m, repmat({'Recupero'}, 1, length(pos_r_lato))];
    
    % --- CALCOLO LARGHEZZE E VOLUMI ---
    larghezze = 2 * sqrt(R^2 - tutte_pos.^2);
    volumi_assi = (larghezze .* tutti_sp .* L_tronco) / 1e6; % dm^3
    
    T = table((1:length(tutte_pos))', tutti_tipi', tutti_sp', larghezze', volumi_assi', ...
        'VariableNames', {'ID', 'Tipo', 'Spessore_mm', 'Larghezza_mm', 'Volume_dm3'});

    % --- STATISTICHE SCARTO ---
    V_legname_tot = sum(volumi_assi);
    V_scarto = V_tronco - V_legname_tot;
    resa = (V_legname_tot / V_tronco) * 100;

    statistiche = struct('Volume_Tronco_dm3', V_tronco, ...
                        'Volume_Legname_dm3', V_legname_tot, ...
                        'Volume_Scarto_dm3', V_scarto, ...
                        'Resa_Percentuale', resa);
    
    % Output a video
    fprintf('\n--- RIEPILOGO VOLUMI ---\n');
    fprintf('Volume Totale Tronco: %.2f dm3\n', V_tronco);
    fprintf('Volume Legname Ricavato: %.2f dm3\n', V_legname_tot);
    fprintf('Volume Scarto (Sfrido + Lama): %.2f dm3\n', V_scarto);
    fprintf('Resa Utile: %.1f%%\n', resa);
end