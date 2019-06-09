%% Capstone
%%Speaker choice
%US West  = 1, US East =2, UK = 3,CHINA = 4

%% User input choice here
choice = 1;

%% Gender Classifier
%speech = importdata('sadierecording.txt','r');

y = importdata('recordingsadie.txt');
Fs = 16000;
% [y,Fs] = audioread('english100.mp4');
filename = sprintf('%s%s','speech','.wav');
audiowrite(filename,y,Fs);

t = 0:0.001:1-0.001;

ydft = fft(y);
freq = 0:Fs/length(y):Fs/2;
ydft = ydft(1:length(y)/2+1);
[maxval,idx] = max(abs(ydft));
f0=freq(idx);  %this is frequency corresponding to max value

clear y Fs

if f0 < 120
    output = 1; %male
else
    output =2;  %female
end

%% Playback
if(choice == 1)%United States West Coast
    if(output ==1)%Male
        [accent,fs]=audioread('USWestmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('USWestfemale.mp3');
        sound(accent,fs);
    end
elseif (choice == 2)%United States East Coast
    if(output ==1)%Male
        [accent,fs]=audioread('USEastmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('USEastfemale.mp3');
        sound(accent,fs);
    end
elseif (choice == 3)%United Kingdom
    if(output ==1)%Male
        [accent,fs]=audioread('UKmale.mp3');
        save new_file accent fs
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('UKfem.mp3');
        sound(accent,fs);
    end
elseif (choice ==4)%China (Mandarin)
    if(output ==1)%Male
        [accent,fs]=audioread('MANmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('MANfem.mp3');
        sound(accent,fs);
    end
end