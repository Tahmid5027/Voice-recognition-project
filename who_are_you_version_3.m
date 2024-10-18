clc; clear all; close all;

%% Load audio files
[speaker1, fs] = audioread('asfi.wav');
[speaker2, fs] = audioread('bristy2.wav');
[speaker3, fs] = audioread('tahmid.wav');
[speaker4, fs] = audioread('fardin.wav');
% Combine all audio files into an array
audioData = [speaker1, speaker2, speaker3, speaker4];

% Define the number of sub-sections
numSections = 10;

% Calculate the length of each sub-section
sectionLength = floor(size(audioData, 1) / numSections);

% Divide each audio file into sub-sections
speakerSections = zeros(numSections, sectionLength, size(audioData, 2));
for i = 1:numSections
    startIndex = (i-1) * sectionLength + 1;
    endIndex = i * sectionLength;
    speakerSections(i, :, :) = audioData(startIndex:endIndex, :);
end
