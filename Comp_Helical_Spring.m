clc
clear
%function [SP] = Comp_Helical_Spring(F,Smat,SF)
% Reference - 
% INPUT: F-force, Smat - spring material, SF - safety factor, 
%        E_cond - coil support end condition,SE_Type - spring end type
% OUTPUT: SP - spring parameters
%
%% spring end type, SE_type
SE_type = {' Plain', ' Plain & Ground', ' Squared & Closed', ' Squared & Ground'};
prompt1 = 'Select Spring end type:';
Bname = 'Spring support end condition:'; % 'Name','File Selection'
Bsize = [300,70]; % size of list box
[indx1,tf1] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt1, 'SelectionMode','single', 'ListString',SE_type);
% ------------------------------------------------------------
%
%% Spring coil support end condition, E_cond
E_cond ={' Spring supported between flat parallel surfaces (fixed ends)', ...
    ' One end supported by flat surface (fixed) & other end pivoted (hinged)', ...
    ' Both ends pivoted (hinged)', ' One end clamped & other end free'};
prompt2 = 'Select Spring support end condition:';
Bname = 'Spring support end condition:'; % 'Name','File Selection'
Bsize = [400,70]; % size of list box
[indx2,tf2] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt2, 'SelectionMode','single', 'ListString',E_cond);
% 
if indx2 == 1
    alpha = 0.5;
elseif indx2 == 2
    alpha = 0.707;
elseif indx2 == 3
    alpha = 1;
elseif indx2 == 4
    alpha = 2;
end
 % ---------------------------------------------------------------  
 %% Spring material - Smat
 Smat ={' Music wire (A228)', ' Oil tempered wire (A229)', ...
    ' Hard-drawn wire (A227)', ' Chrome-vanadium wire (A232)', ...
    ' Chrome-silicon wire (A401)', ' 302 Stainless wire-1 (A313)', ....
    ' 302 Stainless wire-2 (A313)', ' 302 Stainless wire-3 (A313)', ...
    ' Phosphor-bronze wire-1 (B159)', ' Phosphor-bronze wire-2 (B159)', ...
    ' Phosphor-bronze wire-3 (B159)', 'User defined material'};
prompt3 = 'Select Spring Material (ASTM):';
Bname = 'Spring Material (ASTM):'; % 'Name','File Selection'
Bsize = [300,150]; % size of list box
[indx3,tf3] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt3, 'SelectionMode','single', 'ListString',Smat);
% MP - material properties
% MP =[m A RC dmin dmax E G], m - exponent, A constant, RC- relative cost
% dmin - min wire diameter, dmax - max wire diameter, E- modulus of
% elasticty, G - Modulus of rigidityMP
MP = [0.145 2211 2.6 0.10 6.5 193 80
     0.190 1783 1.0 0.7 12.7 196.5 78.6
     0.187 1855 1.3 0.5 12.7 196.5 77.2
     0.168 2005 3.1 0.8 11.1 203.4 77.2
     0.108 1974 4.0 1.6 9.5 203.4 77.2
     0.146 1867 9.3 0.3 2.5 193 69.0
     0.263 2065 9.3 2.5 5 193 69.0
     0.478 2911 9.3 5 10 193 69.0
     0 1000 8.0 0.1 0.6 103.4 41.4
     0.028 913 8.0 0.6 2 103.4 41.4
     0.064 932 8.0 2 7.5 103.4 41.4];
 %
dmin = MP(indx3,4); dmax = MP(indx3,5);
d_temp = dmin:0.1:dmax;% is for music wire material type
dLength = length(d_temp); % length of iteration or size of iteration 

 % 4 ? C ? 12, 3 ? Na ? 15, ? ? 0.15, ns ? 1.2, 
 % fom = ?(relative material cost)??^2d^2Nt/ D^4
%% Spring assembly condition, SA_cond
SA_cond ={' Over a rod, as-wound or set', ' Free, as-wound', ...
    ' Free, set removed', ' In a hole, as-wound or set'};
prompt4 = 'Select Spring assembly condition:';
Bname = 'Spring assembly condition condition:'; % 'Name','File Selection'
Bsize = [400,70]; % size of list box
[indx4,tf4] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt4, 'SelectionMode','single', 'ListString',SA_cond);
%
if indx4 == 1
    answer1='Enter Diameter of rod: ';
    answer2='Enter Tolerance (clearnce b/n rod & spring: ';
    prompt2 = {answer1, answer2};
    title2 = 'Inputs for spring Over a rod';
    dims2 = [1 65];
    definput2 = {'4','0.2'};
    % input dialogue box for user input
    Input2 = inputdlg(prompt2,title2,dims2,definput2);
    d_rod = str2double(Input2{1});
    tol = str2double(Input2{2});
    %
elseif indx4 == 4
    answer1='Enter Diameter of hole: ';
    answer2='Enter Tolerance (clearnce b/n hole & spring: ';
    prompt2 = {answer1, answer2};
    title2 = 'Inputs for spring in a hole';
    dims2 = [1 65];
    definput2 = {'4','0.2'};
    % input dialogue box for user input
    Input2 = inputdlg(prompt2,title2,dims2,definput2);
    d_hole = str2double(Input2{1});
    tol = str2double(Input2{2});
    %
end
%%
ymax = 1.5; % spring deflection
RL = 1.5; % robust linearity
ns = 1.2; % factor of safety
m = MP(indx3,1); A = MP(indx3,2); G = MP(indx3,7); RC = MP(indx3,3);
Fmax = 88.96; gamma = 7.75; % specific weight
SP = zeros(dLength,12);%to intitializing the work
for i = 1:dLength
    d = d_temp(i);
    Sut = A/d^m;
    Ssy = 0.45*Sut;
    if indx4 ==1
        D = d_rod+d+tol;
    elseif indx4 == 2
        al = Ssy/ns; % al - alpha
        bt = (8*(1+RL)*Fmax)/(pi*d^2); % bt - betta, RL - robust of linearity
        C = (2*al-bt)/(4*bt) + sqrt(((2*al-bt)/(4*bt))^2-3*al/(4*bt));
        D = C*d;
    elseif indx4 == 3
        Ssy = (0.65*A)/d^m;
        D = (Ssy*pi*d^3)/(8*ns*(1+RL)*Fmax);
    elseif indx4 == 4
        D = d_hole-d-tol;
    end
    %% Spring Parameters
    C = D/d;
    KB = (4*C+2)/(4*C-3);
    Tau_s = (KB*8*(1 + RL)*Fmax*D)/(pi*d^3);
    ns = Ssy/Tau_s;
    OD = D + d;
    ID = D - d;
    Na = (G*d^4*ymax)/(8*D^3*Fmax);
    k = (d^4*G)/(8*D^3*Na); % spring rate
    % ymax = F/k; % deflection
    %
    % Ne - end coils, Na - active coils, Nt - total coils, Lo - free length
    % Ls - solid length, p - pitch
    if indx1 == 1 % indx1 spring end type
        Ne = 0; Nt = Na; Ls = d*(Nt+1); Lo = ymax+Ls; p = (Lo-d)/Na;
    elseif indx1 == 2
        Ne = 1; Nt = Na+1; Ls = d*Nt; Lo = ymax+Ls; p = Lo/(Na+1);
    elseif indx1 == 3
        Ne = 2; Nt = Na+2; Ls = d*(Nt+1); Lo = ymax+Ls; p = (Lo-3*d)/Na;
    elseif indx1 == 4
        Ne = 2; Nt = Na+2; Ls = d*Nt; Lo = ymax+Ls; p = (Lo-2*d)/Na;
    end
    %
    Lo_cr = 2.63*D/alpha;
    fom = -(RC)*gamma*pi^2*d^2*Nt*D/4;
    % Spring parameters, SP
    SP(i,:) = [d D C OD ID Na Nt Ls Lo Lo_cr ns fom];
end

 