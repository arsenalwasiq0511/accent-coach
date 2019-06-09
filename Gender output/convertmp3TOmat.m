for i= 113
[y,Fs] = audioread(sprintf('%s%d%s','english',i,'.mp4'));
% [y,Fs] = audioread('english100.mp4');
filename = sprintf('%s%d%s','english',i,'.wav');
audiowrite(filename,y,Fs);

    t = 0:0.001:1-0.001;
    
    ydft = fft(y);
    freq = 0:Fs/length(y):Fs/2;
    ydft = ydft(1:length(y)/2+1);
    [maxval,idx] = max(abs(ydft));
    f0=freq(idx);  %this is frequency corresponding to max value

filename2 = sprintf('%s%d%s','english',i, '.mat');
save(filename2);
clear y Fs

end
