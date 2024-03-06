function timecode =seconds_to_timecode(seconds,fps)


integ = fix(seconds);
frac  = mod(seconds,1);

ff = floor(frac*fps);

hh = fix(integ/3600);
integ = integ-hh*3600;
mm = fix(integ/60);
ss = integ-mm*60;

timecode = [sprintf( '%02d', hh) ':' sprintf( '%02d', mm) ':' sprintf( '%02d', ss) ':' sprintf( '%02d', ff)];


end