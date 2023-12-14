%Names: Gabriel Olszewski and Anthony Mauro
%Signals and Systems 3302-01
%Final Project - High/Low Pass Filters on Audio

%Directions: Run the section with which sound the user wants to be 
%            loaded and used in the high-pass and low-pass filters.
%            The original sound will be played and then the user can
%            compare it when the sound is run through a low or high
%            pass filter. CannonFire gives the best resulting sounds
%            when passed through the filters because the sounds are very
%            noticeably different, as with the other sounds it will
%            be slightly harder to hear the differences.
%% 

[data, Fs] = audioread('CannonFire.mp3'); %Load Sound
p = 0:(5/237935):5; %Make vector for 5 seconds
t = p';
sound(data, Fs)
%% 

[data, Fs] = audioread('FrogSound.mp3'); %Load Sound
p = 0:(6/267887):6; %Make vector for 6 seconds
t = p';
sound(data, Fs)
%% 

[data, Fs] = audioread('BearSound.mp3'); %Load Sound
p = 0:(6/242543):6; %Make vector for 6 seconds
t = p';
sound(data, Fs)
%% 

[data, Fs] = audioread('Whistle.mp3'); %Load Sound
p = 0:(6/242543):6; %Make vector for 6 seconds
t = p';
sound(data, Fs)
%% 
%Low Pass Filter
%***MAY NEED TO TURN VOLUME UP IF SOUND IS TOO QUIET***

sound(data,Fs) %Plays Original Sound First

pause(6); %Wait 6 Seconds

RCval = 150;  %Test 1
g = tf(1, [RCval 1]);
lp = lsim(g, data(:,1)*10000, t);
lp2 = lsim(g, data(:,2)*10000,t);
sound((lp+lp2)*5,Fs)  %Plays Sound After Low-Pass Filter Test 1

pause(6); %Wait 6 Seconds

RCval = 75;  %Test 2
g = tf(1, [RCval 1]);
lp = lsim(g, data(:,1)*10000, t);
lp2 = lsim(g, data(:,2)*10000,t);
sound((lp+lp2)*5,Fs) %Plays Sound After Low-Pass Filter Test 2

%bode(g) %Uncomment to Show Low-Pass Bode Plot

%%
%High Pass Filter
% ***BE AWARE THAT SOUNDS WILL GET VERY LOUD, TURN DOWN VOLUME***

sound(data,Fs) %Plays Original Sound First

pause(6); %Wait 6 Seconds

RCval = 500; %Test 1
g = tf([1 0], [1/RCval 1]);
hp = lsim(g, data(:,1)*2000, t);
hp2 = lsim(g, data(:,2)*2000,t);
sound(hp+hp2,Fs) %Plays Sound After High-Pass Filter Test 1

pause(6); %Wait 6 Seconds

RCval = 10000;  %Test 2
g = tf([1 0], [1/RCval 1]);
hp = lsim(g, data(:,1)*2000, t);
hp2 = lsim(g, data(:,2)*2000,t);
sound(hp+hp2,Fs) %Plays Sound After High-Pass Filter Test 2

%bode(g) %Uncomment to Show High-Pass Bode Plot



