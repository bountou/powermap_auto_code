function timecode = frames_to_timecode(N_frames,fps)


hh = fix(N_frames/(3600*fps));
N_frames = N_frames-hh*3600*fps;
mm = fix(N_frames/(60*fps));
N_frames = N_frames-mm*60*fps;
ss = fix(N_frames/fps);
ff = N_frames-floor(ss*fps);

timecode = [sprintf( '%02d', hh) ':' sprintf( '%02d', mm) ':' sprintf( '%02d', ss) ':' sprintf( '%02d', ff)];


end