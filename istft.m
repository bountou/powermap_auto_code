% inverse TF function
function x = istft(X, winsize,hopsize)
%[x] = istft(X,winsize,hopsize)
%  INPUT:
%   X = input signal in stft domain: (frequency)x(time)
%   winzise = size of the window
%   hopsize = size of the overlap between two windows
%
%  OUTPUT:
%   x time domain signal from the istft analysis of input X

Nwin  = size(X,2);
x     = zeros(Nwin*hopsize+winsize,1);
w     = sqrt(hanning(winsize,'periodic'));
index = 0;
for ii = 1:Nwin
    temp                     = ifft(X(:,ii));
    x(index+1:index+winsize) = x(index+1:index+winsize) + temp.*w;
    index                    = index + hopsize;
end
x = x(hopsize+1:end-winsize-hopsize/4);

end
