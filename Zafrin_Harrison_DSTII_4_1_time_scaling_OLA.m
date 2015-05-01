% DSTII Homework 4 Part 1 %
% Harrison Zafrin hzz200
% Pitch Shifting with OLA Function
% x_t = input signal
% n_overlap = overlap in samples, derived from win_size and hop_size
% alpha = time scaler, should be 0.25<=alpha<=2
% fs = sampling rate
% pitch_on = boolean true or false to turn on pitch scaling via resmaple
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ output ] = Zafrin_Harrison_DSTII_4_1_time_scaling_OLA( x_t, win_size, hop_size, alpha, fs, pitch_on )

% Error Check
if alpha < 0.25 || alpha > 2
    error('alpha must be 0.25<=alpha<=2');
end

% Error Check
if pitch_on ~= 1 && pitch_on ~= 0
    error('pitch_on is either 0 or 1 for T or F');
end

% Error Check
if hop_size > win_size  
   error('win_size > hop_size');
end 

% Time Scaling of the Hop Size using Alpha
hop_size = round(alpha*hop_size);

% Create Window
window = hann(win_size);

% Get n_overlap
n_overlap = win_size - hop_size;

% Buffer x_t with n_overlap
x_t_buff = buffer(x_t, win_size, n_overlap, 'nodelay');

% Create Window Matrix
window_mat = repmat(window, 1, size(x_t_buff, 2));

% Window the Signal
x_t_windowed = x_t_buff .* window_mat;

% Unbuffer for Overlap and Add
% Pre-Allocate Output Vector
[win_length, num_win] = size(x_t_windowed);
hop_size = win_length/2;
x_t_unbuffered = zeros(((num_win-1) * hop_size)+win_length, 1);

% Unbuffer the Windowed Kernel
for i=1:num_win
    seg_start    = (i-1)*hop_size+1;
    seg_end      = (i*win_length)-(hop_size*(i-1));
    x_t_unbuffered(seg_start:seg_end)  = x_t_unbuffered(seg_start:seg_end) + x_t_windowed(:,i); 
end

% Transpose the Signal
y = x_t_unbuffered';

% For Pitch Transposing While Retaining Original Time Scale TRUE
if pitch_on == 1
    
    % Duration in Seconds
    N1 = round(length(x_t)/fs);
    N2 = round(length(y)/fs);

    % Resample for Pitch
    y = resample(y, N1, N2);
    
end

% Normalize Output
output = y/max(y);

end

