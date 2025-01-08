%
%% DoMEs - Design of Machine Elements, MASTER SCRIPT
%%
clear
clc
%%
% List of various machine elements
MEtype = {'Bearings', 'Belts & Pulleys', 'Brakes', 'Chain drives', ...
    'Clutches', 'Columns & Struts', 'Cotter & Knuckle joints', ...
    'Couplings', 'Flywheels', 'Gears', 'Keys', 'Power screws', ...
    'Riveted joints', 'Rope drives', 'Screwed joints', 'Shafts', ...
    'Springs', 'Welded joints'};
prompt1 = 'Select type of Machine Element:';
Bname = 'Design of Machine Elements:'; % 'Name','File Selection'
Bsize = [250,250]; % size of list box
%
[indx,tf] = listdlg('Name',Bname, 'ListSize',Bsize, ...
    'PromptString',prompt1, 'SelectionMode','single', 'ListString',MEtype);
%%
switch indx
    case 1
        disp('  Design of Bearings')
        disp('  ------------------ ')
    case 2
        disp('  Design of Belt & Pulleys')
        disp('  -------------------------')
        DesignOFBelt;%calling belt design files 
    case 3
        disp('  Design of Brakes')
        disp('  ----------------')     
    case 4
        disp('  Desing of Chain drives')
        disp('  ----------------------')        
    case 5
        disp('  Design of Clutches')
        disp('  ------------------')        
    case 6
        disp('  Design of Columns & Struts')
        disp('  --------------------------')        
    case 7
        disp('  Design of Cotter & Knuckle joints')
        disp('  ---------------------------------')        
    case 8
        disp('  Design of Couplings')
        disp('  -------------------')        
    case 9
        disp('  Design of Flywheels')
        disp('  -------------------')        
    case 10
        disp('  Design of Gears')
        disp('  ---------------')  
    case 11
        disp('  Design of Keys')
        disp('  --------------') 
        KeyDesign % calling key design function
    case 12
        disp('  Design of Power screws')
        disp('  ----------------------')        
    case 13
        disp('  Design of Riveted joints')
        disp('  ------------------------')        
    case 14
        disp('  Design of Rope drives')
        disp('  ---------------------') 
    case 15
        disp('  Design of Screwed joints')
        disp('  ------------------------') 
    case 16
        disp('  Design of Shafts')
        disp('  ----------------')         
    case 17
        disp('  Design of Springs')
        disp('  -----------------') 
        DesignOFsprings;%calling spring design function 
    case 18
        disp('  Design of Welded joints')
        disp('  -----------------------') 
end
%                