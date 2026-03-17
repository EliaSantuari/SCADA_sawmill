%% Parameters

% H : Hardness
% v_r = Rollers Velocity

wood = [0 1 2 3 4 5]; %         Abete, Pino, Larice, Castagno, Faggio
H = [0 40 60 70 80 250]; %      N/mm^2

% Nel caricatronchi salgono 1 5 2 4 3
magazzino_legno = [1 5 2 4 3];
magazzino_diametri = [430 320 260 230 540];

K1 = 1; % I_blade = K1 * H * v_r

% Current Limits
I_idle = 6; %       Ampere
I_ideal = 20; %     Ampere
I_thresh = 45; %    Ampere

tau = 0.5; 

% calcolaTaglioOttimizzato(D, L, sp_main, sp_fianchi, sp_lama, larg_minima) 
assi_totali = calcolaTaglioOttimizzato(420, 4000, 80, 20, 5, 100);

disp(assi_totali)