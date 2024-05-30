close all
clc
clear all
%%PROGRAM SLUŻĄCY DO TWORZENIA WYKRESÓW BODEGO MODELU RLC Z TRANSMITANCJA


%% GŁÓWNE PARAMETRY
%symulacji
Fs = 1000e3; %Czestotlwosc probkowania
dt = 1/Fs; %krok
T = 0.001; %stoptime symulacji
%obwodu
R = 100; %Ohm
L = 10e-3; %Henr
C = 10e-9; %Farad
%Parametry dobrane tak, że częstotliwość środkowa wynosi 15,915kHz

%parametry SINUS
A = 10;
f = 2*pi*30;
%parametry CHIRP
initial_freq = 0;
target_freq = 15000;
target_time = 0.5;
%parametry SZUM
mean = 0;
variance = 3;
seed = 0;

%% WYKRES BODEGO DLA OBLICZONEJ TRANSMITACJI - BEZ WEJSCIA
H = tf([1 0],[L*C R*C  1]);
figure
bode(H);
title('Bode [rad]')

figure
bodef(H);
title('Bode [Hz]')

%% WYKRES BODEGO - SYMULACJA Z WEJSCIEM SINUS
out1 = sim('modelRLC_TRANSFORMATA_sinus');
wejscie_sinus = out1.wejscie(:,1);
wyjscie_sinus = out1.wyjscie(:,1);

S_wyj_sinus = fft(wyjscie_sinus);
S_wej_sinus = fft(wejscie_sinus);

x_sinus = 20*log10(abs(S_wyj_sinus./S_wej_sinus));
faza_sinus = angle(S_wyj_sinus./S_wej_sinus);


figure, subplot(2,1,1)
f_axis_sinus = (0:length(x_sinus)-1)/length(x_sinus)*Fs;
semilogx(f_axis_sinus, x_sinus)
xlabel('Częstotliwość [Hz]')
ylabel('Wartość [dB]')
title('Wartość 20log10(S_{wyj}/S_{wej}) sinus')
subplot(2,1,2)
semilogx(f_axis_sinus, faza_sinus)
xlabel('Częstotliwość [Hz]')
ylabel('Faza')
%%  WYKRES BODEGO - SYMULACJA Z WEJSCIEM CHIRP
out2 = sim('modelRLC_TRANSFORMATA_chirp');
wejscie_chirp = out2.wejscie(:,1);
wyjscie_chirp = out2.wyjscie(:,1);

S_wyj_chirp = fft(wyjscie_chirp);
S_wej_chirp = fft(wejscie_chirp);

x_chirp = 20*log10(abs(S_wyj_chirp./S_wej_chirp));
faza_chirp = angle(S_wyj_chirp./S_wej_chirp);

figure, subplot(2,1,1)
f_axis_chirp = (0:length(x_chirp)-1)/length(x_chirp)*Fs;
semilogx(f_axis_chirp, x_chirp)
xlabel('Częstotliwość [Hz]')
ylabel('Wartość [dB]')
title('Wartość 20log10(S_{wyj}/S_{wej}) chirp')
subplot(2,1,2)
semilogx(f_axis_chirp, faza_chirp)
xlabel('Częstotliwość [Hz]')
ylabel('Faza')
%%  WYKRES BODEGO - SYMULACJA Z WEJSCIEM SZUM
out3 = sim('modelRLC_TRANSFORMATA_szum');
wejscie_szum = out3.wejscie(:,1);
wyjscie_szum = out3.wyjscie(:,1);

S_wyj_szum = fft(wyjscie_szum);
S_wej_szum = fft(wejscie_szum);

x_szum = 20*log10(abs(S_wyj_szum./S_wej_szum));
faza_szum = angle(S_wyj_szum./S_wej_szum);

figure, subplot(2,1,1)
f_axis_szum = (0:length(x_szum)-1)/length(x_szum)*Fs;
semilogx(f_axis_szum, x_szum)
xlabel('Częstotliwość [Hz]')
ylabel('Wartość [dB]')
title('Wartość 20log10(S_{wyj}/S_{wej}) szum')
subplot(2,1,2)
semilogx(f_axis_szum, faza_szum)
xlabel('Częstotliwość [Hz]')
ylabel('Faza')

%% WYKRES BODEGO - SYMULACJA Z WEJSCIEM IMPULS
out4 = sim('modelRLC_TRANSFORMATA_impuls');
wejscie_impuls = out4.wejscie(:,1);
wyjscie_impuls = out4.wyjscie(:,1);

S_wyj_impuls = fft(wyjscie_impuls);
S_wej_impuls = fft(wejscie_impuls);

x_impuls = 20*log10(abs(S_wyj_impuls./S_wej_impuls));
faza_impuls = angle(S_wyj_impuls./S_wej_impuls);

figure, subplot(2,1,1)
f_axis_impuls = (0:length(x_impuls)-1)/length(x_impuls)*Fs;
semilogx(f_axis_impuls, x_impuls)
xlabel('Częstotliwość [Hz]')
ylabel('Wartość [dB]')
title('Wartość 20log10(S_{wyj}/S_{wej}) impuls')
subplot(2,1,2)
semilogx(f_axis_impuls, faza_impuls)
xlabel('Częstotliwość [Hz]')
ylabel('Faza')

%% WYKRESY SINUSA(F1,F2,F3) W CZASIE
f_zmienne = 2*pi*12e3;
out5 = sim('modelRLC_TRANSFORMATA_sinuszmienny');
wejscie_sinus_12kHz = out5.wejscie(:,1);
wyjscie_sinus_12kHz  = out5.wyjscie(:,1);

f_zmienne = 2*pi*15900;
out6 = sim('modelRLC_TRANSFORMATA_sinuszmienny');
wejscie_sinus_15kHz = out6.wejscie(:,1);
wyjscie_sinus_15kHz = out6.wyjscie(:,1);

f_zmienne = 2*pi*20000;
out7 = sim('modelRLC_TRANSFORMATA_sinuszmienny');
wejscie_sinus_20kHz = out7.wejscie(:,1);
wyjscie_sinus_20kHz = out7.wyjscie(:,1);

figure
plot(out5.tout,wyjscie_sinus_12kHz)
hold on
plot(out6.tout,wyjscie_sinus_15kHz)
hold on
plot(out7.tout, wyjscie_sinus_20kHz)
title('Rozne czestotliwosci nalozone')
legend('Wyjscie 12kHz','Wyjscie 15kHz', 'Wyjscie 20kHz')

% Stała skalująca dla lepszej wizualizacji
skalowanie = 100000;
skalowanie2 = 1000000% Możesz dostosować tę wartość według potrzeb

% Wykres wejścia i wyjścia dla częstotliwości 12 kHz ze skalowaniem
figure;
subplot(3,1,1);
plot(out5.tout, wejscie_sinus_12kHz * skalowanie);
hold on;
plot(out5.tout, wyjscie_sinus_12kHz);
title('Porównanie wejścia i wyjścia (f=12kHz)');
legend('Wejście', 'Wyjście');
xlabel('Czas');
ylabel('Amplituda');
grid on;

subplot(3,1,2);
plot(out6.tout, wejscie_sinus_15kHz * skalowanie2);
hold on;
plot(out6.tout, wyjscie_sinus_15kHz);
title('Porównanie wejścia i wyjścia (f=15kHz)');
legend('Wejście', 'Wyjście');
xlabel('Czas');
ylabel('Amplituda');
grid on;

subplot(3,1,3);
plot(out7.tout, wejscie_sinus_20kHz * skalowanie);
hold on;
plot(out7.tout, wyjscie_sinus_20kHz);
title('Porównanie wejścia i wyjścia (f=20kHz)');
legend('Wejście', 'Wyjście');
xlabel('Czas');
ylabel('Amplituda');
grid on;








