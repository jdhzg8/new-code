clear *; close all; clc;

% A modified version of the answer to problem 15.  See problem 15 for 
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

% This is the only new code (compared to problem 15);
delta=2e-3;
x_digital=round(x/delta)*delta;

hold on;
plot(t,x,'o',t,x_digital,'*');
title('Homework #1 Problem 16 Analog and Digital Signals');
x_digital'

% Here is some extra code I didn't expect you to write, but hopefully it
% helps you understand what's going on with analog waveforms, discrete time
% and digital signals

% After you press ENTER, the plot will zoom in to just one sample, so you
% can more clearly see the difference between the analog (blue line)
% discrete time (circle) and digital (star) signals
input('Press ENTER to continue');
figure(1); % Bring figure 1 to the top of the PC screen
xlim([-.5,.5]*1e-7);
legend('analog','discrete time','digital','Location','NorthWest')

% After you press ENTER, the plot will show you the difference between the
% discret time and digital signals for all the samples.  This is called the
% quantization error or quantization noise
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


