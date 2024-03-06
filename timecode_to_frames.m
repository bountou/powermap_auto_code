function N_frames = timecode_to_frames(timecode,fps)

hh  = str2num(timecode(1:2));
mm  = str2num(timecode(4:5));
ss  = str2num(timecode(7:8));
ff  = str2num(timecode(10:11));

N_frames = floor(hh*3600*fps) + floor(mm*60*fps) + floor(ss*fps) + ff ;


end