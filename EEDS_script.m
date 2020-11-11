clc; clear all; close all;

t_sim=50400;    %Simulation time - 12 [h] is 43 200 [s]
                %14[h] is 50 400[s]

simin_d=zeros(t_sim,2); %Discharge current [A] (variable)
simin_d(:,1)=[1:t_sim];
simin_d(1:1800,2)=2.8; % Half an hour of current 1,8[A]
for i=1800:5400 % One hour of dicreasing current
    simin_d(i,2)=simin_d(i-1,2)-0.8/(5400-1800);
end
simin_d(5400:t_sim,2)=2; %Current 0,8[A] for the rest of the mission



% irr_time=zeros(t_sim,1);     %Time of the day - 12h
% irr_time(1)=6; %Beggining of the simulation 6AM
% for i=2:t_sim
%     irr_time(i)=irr_time(i-1)+(1/3600);
% end

%Day time
irr_time=zeros(t_sim,1);     %Time of the day
irr_time(1)=5; %Beggining of the simulation 6AM
for i=2:t_sim
    irr_time(i)=irr_time(i-1)+(1/3600);
end


%-------------------MOTOR PARAMETERS-------------------------

%R - Terminal Resistance [ohm]
%km - Torque constant/100 [NmA^-1]
%L - Terminal inductance/1000 [H]
%J - Rotor inertia/(1000*100^2) [kgm^2]
%Rs0 - No load speed [rpm]
%ke=(Nominal voltage-Terminal Resistance*Nominal current)
%B=((km*Nominal current)-(Friction torque/100))

%for motor e.g.24V,48V,60V
%V12 RPX32-090
R=0.88;
km=(18/1000)/100;
L=331/(10^(-6)); %[H]
J=18.3/(1000*100^2) %[kgm^2]
Rs0=6240;
V=6; %Nominal voltage [V]
A=0.129; %Nominal current [A]
F=260; %Friction torque [mNm]
ke=(V-R*A);
B=km*A-F/100;


