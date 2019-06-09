clear;
clc;
%% Capstone 
%%Speaker choice
    %US = 1, UK = 2, AUSTRALIA = 3
    %MEXICO = 4, SPAIN = 5, COLOMBIA = 6, 
    %CHINA = 7
choice = 1;

%% Gender Classifier
[y,Fs] = audioread('english104.mp4');
filename = sprintf('%s%d%s','english',i,'.wav');
audiowrite(filename,y,Fs);
filename = sprintf('%s%s','speech','.wav');
audiowrite(filename,y,Fs);

    t = 0:0.001:1-0.001;
    
    ydft = fft(y);
    freq = 0:Fs/length(y):Fs/2;
    ydft = ydft(1:length(y)/2+1);
    [maxval,idx] = max(abs(ydft));
    f0=freq(idx);  %this is frequency corresponding to max value

 clear y Fs

 if f0 < 150 | f0>350
    output = 1; %male
else
    output =2; %female
end

%%Play Sounds
if(choice == 1)%United States/Canada
    if(output ==1)%Male
        [accent,fs]=audioread('USmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('USfem.mp3');
        sound(accent,fs);
    end 
elseif (choice == 2)%United kingdom
    if(output ==1)%Male
        [accent,fs]=audioread('UKmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('UKfem.mp3');
        sound(accent,fs);
    end  
elseif (choice == 3)%Australia/New Zealand
    if(output ==1)%Male
        [accent,fs]=audioread('AUSmale.mp3');
        save new_file accent fs
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('AUSfem.mp3');
        sound(accent,fs);
    end 
elseif (choice ==4)%Mexico
    if(output ==1)%Male
        [accent,fs]=audioread('MEXmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('MEXfem.mp3');
        sound(accent,fs);
    end 
elseif (choice == 5)%Spain
    if(output ==1)%Male
        [accent,fs]=audioread('SPAmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('SPAfem.mp3');
        sound(accent,fs);
    end
elseif (choice ==6)%Colombia
    if(output ==1)%Male
        [accent,fs]=audioread('COLmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('COLfem.mp3');
        sound(accent,fs);
    end 
elseif (choice ==7)%Mandarin
    if(output ==1)%Male
        [accent,fs]=audioread('MANmale.mp3');
        sound(accent,fs);
    elseif(output ==2)%Female
        [accent,fs]=audioread('MANfem.mp3');
        sound(accent,fs);
    end 
end