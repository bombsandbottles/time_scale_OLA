% DSTII Homework 4 Part 1 %
% Harrison Zafrin hzz200
% Pitch Shifting with OLA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Import Audio
[x_t, fs, t] = import_audio('trumpet_test.wav');

% Parameters for OLA
win_size = 4096;
hop_size = win_size/2;
alpha = 0.25; %Super Slow Down
pitch_on = 0; %0 for False

% Time Scaling via OLA no Pitch Shifting
[ output_OLA ] = Zafrin_Harrison_DSTII_4_1_time_scaling_OLA( x_t,...
                                                            win_size,...
                                                            hop_size,...
                                                            alpha,...
                                                            fs,...
                                                            pitch_on);

                                                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tune It with a new Alpha Scaled to Semi-Tones (-5 is 5 semi-tones up)
alpha = 2^(-5/12);

% Turn on Pitch Mode, 1 for true
pitch_on = 1; 

% Pitch Shifting via OLA, Time-Scaling Restored via Resampling
[ output_POLA ] = Zafrin_Harrison_DSTII_4_1_time_scaling_OLA( x_t,...
                                                            win_size,...
                                                            hop_size,...
                                                            alpha,...
                                                            fs,...
                                                            pitch_on);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Test Outputs if you want

% OLA
% soundsc(output_OLA, fs);

% POLA
% soundsc(output_POLA, fs);




