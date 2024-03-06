function timecode = timecode_difference(timecode1, timecode2,fps)

N_frames1 = timecode_to_frames(timecode1,fps);
N_frames2 = timecode_to_frames(timecode2,fps);
N_frames = abs(N_frames1-N_frames2);

timecode = frames_to_timecode(N_frames,fps);

end