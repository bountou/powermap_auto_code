% forward TF function
function [X,time,frequency] = stft(x,winsize,hopsize,fs,Nfft)

%  INPUT:
%   x = input signal
%   winzise = size of the window for the TF analysis
%   hopsize = size of the overlap between two windows
%
%  OUTPUT:
%   X frequency-time signal from the stft analysis of input x

if size(x,1)<size(x,2)
    x=x';
end
if nargin < 2
    winsize = 512;
    hopsize = 256;
    fs      = 44100;
end
if nargin < 4
    fs    = 44100;
end
if nargin < 5
    Nfft = winsize;
end

x     = [zeros(hopsize,1);x;zeros(winsize,1)];
w     = sqrt(hanning(winsize,'periodic')');
Nwin  = floor((length(x)-winsize)/hopsize)+1;
X     = zeros(Nfft,Nwin);
index = 0;
for i=1:Nwin
    x_temp = x(index+1:index+winsize);
    x_w    = x_temp' .* w;
    X(:,i) = fft(x_w,Nfft);
    index  = index + hopsize;
end

% save frequency and time vectors
time      = (0:size(X,2)-1)*hopsize/(fs);
frequency = (0:size(X,1)-1)*(fs)/Nfft;

end

