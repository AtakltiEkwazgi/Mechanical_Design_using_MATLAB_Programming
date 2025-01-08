clear
clc
%% using the list box, listdlg
% selecting the analysis dimension (1D, 2D, 3D)
Ktype = {'Tappered sunk key','Parallel sunk key', 'Gib head key'};
prompt1 = 'Select type of key:';
Bname = 'Design of key:'; % 'Name','File Selection'
Bsize = [300,50]; % size of list box
%
[indx,tf] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt1, 'SelectionMode','single', 'ListString',Ktype);
%%
% --------------------------------------------------------------------
answer1='Enter Power (Kw):';
answer2='Enter Shaft revolution (rpm): ';
answer3='Enter Shaft diameter (m):';
answer4='Enter Shear strength of key (MPa):';
answer5='Enter Crushing strength of key (MPa):';
% 
prompt2 = {answer1, answer2, answer3, answer4, answer5};
title2 = 'Inputs for Key design';
dims2 = [1 65];
definput2 = {'10','1000','30','150','300'};
% input dialogue box for user input
Input2 = inputdlg(prompt2,title2,dims2,definput2);
P = str2double(Input2{1});
N = str2double(Input2{2});
Ds = str2double(Input2{3});
Sts = str2double(Input2{4});
Sc = str2double(Input2{5});
%

%%
%             key cross-section 
% shaft-dia  width  thickness
KS =[6     2     2
     8     3     3
    10     4     4
    12     5     5
    17     6     6
    22     8     7
    30    10     8
    38    12     8
    44    14     9
    50    16    10
    58    18    11
    65    20    12
    75    22    14
    85    25    14
    95    28    16
   110    32    18
   130    36    20
   150    40    22
   170    45    25
   200    50    28
   230    56    32
   260    63    32
   290    70    36
   330    80    40
   380    90    45
   440   100    50];
% input: Ktype - Type of key, Ds - shaft diameter, Sts - shear strength
% Sc - crushing strength, P - power transmitted, N - rpm
[m,n]=size(KS);
for i=1:m-1
    if Ds < KS(1,1)
        w = KS(1,2);
        t = KS(1,3);
    elseif Ds == KS(i,1)
        w = KS(i,2);
        t = KS(i,3);
    elseif Ds > KS(i,1) && Ds <KS(i+1,1)
        w = KS(i+1,2);
        t = KS(i+1,3);
    end
end
%
switch indx
    case 1
        disp(' ---- Design of tappered sunk key ----')
        disp('  ') % empty line for readability
        Kd = Tap_sunk_key(P,N,Ds,Sts,Sc,w,t)
    case 2
        disp(' ---- Design of parallel sunk key ----')
        disp('  ') % empty line for readability
%         FEA_2D % executing M-file 'FEA_2D'
    case 3
        disp(' ---- Design of gibhead key ----')
        disp('  ') % empty line for readability
        Gh =Gib_head_key(P,N,Ds,Sts,Sc)
end

