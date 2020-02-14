%%
% This script will be used in the GEOF-337 cruise report. In this script we
% will include CTD station plotting and also transect plotting for
% different variables that we are interested in 

clear all;close all; clc

load KB2019604_CTD_cal.mat % Change name of the dataset
%% First we are going to make a map of where the CTD stations were taken

Masfjorden_map

%% Now we are gonna plot a section where we will select the stations 
%we want to plot.

beg= CTD(1).st; %first station
fin= CTD(20).st; %last station 

CTD_plot_section