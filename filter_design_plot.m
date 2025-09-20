clc;
clear all;
close all;

%% Filter Parameters
w0 = 1e4;          % Angular frequency (10k rad/s)
f0 = w0/(2*pi);    % Frequency in Hz
fprintf('Center frequency: %.2f Hz\n', f0);

Q  = 10;           % Quality factor
H0 = 1;            % Gain

% Frequency range for plotting
f = logspace(1, 6, 1000);   % 10 Hz to 1 MHz
w = 2*pi*f;

%% Transfer Functions
% Band-Pass Filter
num_BP = [0 -H0/w0 0];
den_BP = [1/(w0^2) 1/(w0*Q) 1];
TF_BP  = tf(num_BP, den_BP);

% Low-Pass Filter
num_LP = H0;
den_LP = [1/(w0^2) 1/(w0*Q) 1];
TF_LP  = tf(num_LP, den_LP);

% High-Pass Filter
num_HP = [H0/(w0^2) 0 0];
den_HP = [1/(w0^2) 1/(w0*Q) 1];
TF_HP  = tf(num_HP, den_HP);

% Band-Stop Filter
num_BS = [1/(w0^2) 0 1];
den_BS = [1/(w0^2) 1/(w0*Q) 1];
TF_BS  = tf(num_BS, den_BS);

%% Frequency Response (Magnitude + Phase)
[mag_BP, phase_BP] = bode(TF_BP, w);
[mag_LP, phase_LP] = bode(TF_LP, w);
[mag_HP, phase_HP] = bode(TF_HP, w);
[mag_BS, phase_BS] = bode(TF_BS, w);

% Convert to dB and unwrap phase
db_BP = 20*log10(squeeze(mag_BP));
db_LP = 20*log10(squeeze(mag_LP));
db_HP = 20*log10(squeeze(mag_HP));
db_BS = 20*log10(squeeze(mag_BS));

ph_BP = squeeze(phase_BP);
ph_LP = squeeze(phase_LP);
ph_HP = squeeze(phase_HP);
ph_BS = squeeze(phase_BS);

%% Plot Magnitude
figure;
subplot(2,1,1);
semilogx(f, db_LP, 'b', 'LineWidth', 2); hold on;
semilogx(f, db_HP, 'r', 'LineWidth', 2);
semilogx(f, db_BP, 'g', 'LineWidth', 2);
semilogx(f, db_BS, 'm', 'LineWidth', 2);
grid on;
title('Magnitude Response of Filters (LP, HP, BP, BS)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Low-pass','High-pass','Band-pass','Band-stop','Location','Best');

%% Plot Phase
subplot(2,1,2);
semilogx(f, ph_LP, 'b', 'LineWidth', 2); hold on;
semilogx(f, ph_HP, 'r', 'LineWidth', 2);
semilogx(f, ph_BP, 'g', 'LineWidth', 2);
semilogx(f, ph_BS, 'm', 'LineWidth', 2);
grid on;
title('Phase Response of Filters (LP, HP, BP, BS)');
xlabel('Frequency (Hz)');
ylabel('Phase (deg)');
legend('Low-pass','High-pass','Band-pass','Band-stop','Location','Best');
