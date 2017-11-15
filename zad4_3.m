clearvars;
close all;
clc;
%%
jet = imread('jet.bmp');
jetHist  = histeq(jet,256);
jetcumsum = cumsum(jet);
