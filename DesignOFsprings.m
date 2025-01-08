%% Design of Springs
%
% selecting the type of spring
Stype = {'Compression helical spring','Tension helical spring', ...
    'Conical springs', 'Volute springs', 'Helical torsion springs', ...
    'Spiral torsion springs', 'Leaf springs', 'Bellevile springs', ...
    'Air springs', 'Liquid springs', 'Rubber springs', 'Ring springs'};
prompt1 = 'Select type of spring:';
Bname = 'Design of Springs:'; % 'Name','File Selection'
Bsize = [300,200]; % size of list box
%
[indx,tf] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt1, 'SelectionMode','single', 'ListString',Stype);
%%
switch indx
    case 1
        disp('Compression helical spring')
        Comp_Helical_Spring
    case 2
        disp('Tension helical spring')
    case 3
        disp('Conical springs')
    case 4
        disp('Volute springs')
    case 5
        disp('Helical torsion springs')
    case 6
        disp('Spiral torsion springs')
    case 7
        disp('Leaf springs')
    case 8
        disp('Bellevile springs')
    case 9
        disp('Air springs')
    case 10
        disp('Liquid springs')
    case 11
        disp('Rubber springs')
    case 12
        disp('Ring springs')
end