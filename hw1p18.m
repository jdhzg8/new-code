clear *; close all; clc;

% A modified version of the answer to problem 17.  See problem 17 for 
% additional comments that don't show up here
fs=1000*1000;
t=[0:1/fs:0.002];
x=-7.8*sin(2*pi*1000*t+10);
plot(t,x);
grid on;
xlabel('Time (seconds)');
ylabel('Voltage (volts)');
fs=8000;
t=[0:1/fs:10/8000];
x=-7.8*sin(2*pi*1000*t+10);

% This is the only new code (compared to problem 17);
max_ADC=100;
min_ADC=-100;

B=8;

delta=(max_ADC-min_ADC)/2^B;
x_digital=round(x/delta)*delta;
x_digital=min(x_digital,max_ADC);
x_digital=max(x_digital,min_ADC);

hold on;
plot(t,x_digital,'*');
title('Homework #1 Problem 18 Analog and Digital Signals');
x_digital'

input('Press ENTER to continue');
clf; % clear old figure
figure(1); % Bring to the front
max_negative=t*0-delta/2;
max_positive=t*0+delta/2;
plot(t,x-x_digital,'*',t,max_negative,'r',t,max_positive,'r');
legend('Quantization Errors','Maximum Possible Error (+/- Delta/2)');
ylim([-.6*delta,.6*delta]);
xlabel('Time (seconds)');
ylabel('Voltage (Volts)');
title('Quantization Errors');


