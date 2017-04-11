clear *; close all; clc;

% To start with, I want to generate a plot that looks like an analog
% waveform.  However Matlab only works with discrete time waveforms.  So
% the way I'm going to do this, is by using a super high sampling
% frequency, so the discrete time and analog waveforms look pretty much the
% same.  By "super high" I mean a sampling frequency that will give me
% 1,000 time samples in each period of the analog waveform.  Another way to
% say the same thing, is to say I'm going to use a sampling frequency that
% is 1,000 times higher than the frequency of the signal (which in this
% case is also 1,000)
fs=1000*1000;

% I did not specify in the problem what time interval you should plot the
% signal over.  I'm going to pick to plot it from t=0 to t=2/1000 seconds.
% That's t=0 to t=.002.  That should give me two cycles of the 1 kHz sine
% wave.  As always, I want the distance between the time samples to be
% 1/fs seconds.  Now I'll make an array of time samples from 0 to .002 in 
% steps of 1/fs
t=[0:1/fs:0.002];

% Now life is pretty easy, I just need to write the equation for the signal
% and plot it
x=-7.8*sin(2*pi*1000*t+10);
plot(t,x);

% These are optional commands, that just make the graph look prettier.
grid on;
xlabel('Time (seconds)');
ylabel('Voltage (volts)');
title('Homework #1 Problem 15 Analog Waveform');

% Here is a way to stop the execution of the matlab script, until the user
% presses the tne ENTER key
input('Click mouse on matlab command window, then press ENTER key to continue execution');

% Now let's generate the discrete time signal I asked for in the problem.
% The problem specified the sampling frequency of 8,000 samples per second,
% which we will usually call 8 kHz.  I only wanted the first 10 samples, so
% I will go from t=0 to t=10/8000;  I'll plot them on the same graph as the
% analog waveform, so you can compare them.
fs=8000;
t=[0:1/fs:10/8000];
x=-7.8*sin(2*pi*1000*t+10);

% Now I'm going to plot the discrete time signal on top of the analog
% signal I already made.  I'll do that by first using the figure(1)
% command.  That will bring the figure to the top of the PC's screen, so
% the user does not have to click on it.  Next I'll use hold on.  Normally
% every time you execute a plot command, Matlab first removes the old graph
% that was there, then plots the new one.  The hold on command tells Matlab
% to not erase the old plot, to just put the new one on top of it.  You can
% do a third, forth, fifth, etc. plot on top of these.  If you want to stop
% this, use the hold off command.
figure(1);
hold on;

% The plot command is the same as the analog signal, except I will use the
% string 'o' at the end.  This tells matlab to not play connect the dots.
% Instead it will lot a circle at each point
plot(t,x,'o');

% Finally, let's change the title.  The hold on command has no impact
% on this, the new titles always destroy the old titles, they do not 
% write on top of them
title('Homework #1 Problem 15 Analog and DT Signals');

% Here is the way I would normally look at x[0] to x[10]
x

% It is just a little bit easier to read them, if you change the array 
% into a single column.  It is trivial to do that in matlab with the
% transpose (single quote) operator, like this
x'

% Here's a real fancy way to display them.  I don't expect you to do this
% normally, I'm just trying to make a final display that makes it a little
% clearer what each number means.  If you are struggling to understand
% matlab, don't bother reading the code below, you don't need it.  But for
% those of you that want an idea of how you can format your output a little
% more cleanly in the command window, I thought this example might help.
% contact me if you can't figure it out.
for i=1:length(x)
    n=i-1;
    disp(['x[',num2str(n),'] = ',num2str(x(i))]);
end

% hehe, being sneaky
