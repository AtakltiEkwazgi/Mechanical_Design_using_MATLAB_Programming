%% Ploting 
%%
clc
clear
clf
x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));
t=1:21;
% plot(x,y, 'LineStyle','--', 'Marker','s', 'Color','r', 'LineWidth',2, ...
%     'MarkerSize',10', 'MarkerEdgeColor','k', 'MarkerFaceColor','g')
%% Ploting properties
%%
Cp{1,1} = 'LineStyle';            Cp{2,1} = ':';
Cp{1,2} = 'Marker';               Cp{2,2} = 'o';
Cp{1,3} = 'Color';                Cp{2,3} = 'r';
Cp{1,4} = 'LineWidth';            Cp{2,4} = 2;
Cp{1,5} = 'MarkerSize';           Cp{2,5} = 10;
Cp{1,6} = 'MarkerEdgeColor';      Cp{2,6} = 'none';
Cp{1,7} = 'MarkerFaceColor';      Cp{2,7} = 'none';
%
plot(x,y,Cp{:})
%
%% Text properties
%%
Ct{1,1} = 'Color';            Ct{2,1} = 'b';
Ct{1,2} = 'Interpreter';      Ct{2,2} = 'tex';        % 'latex' | 'none'
Ct{1,3} = 'FontName';         Ct{2,3} = 'FixedWidth'; % 'Cambria'
Ct{1,4} = 'FontSize';         Ct{2,4} = 10;           % scalar value greater than zero
Ct{1,5} = 'FontWeight';       Ct{2,5} = 'bold';       % 'normal' (default) | 'bold'
Ct{1,6} = 'FontAngle';        Ct{2,6} = 'normal';     % 'normal' (default) | 'italic'
Ct{1,7} = 'FontUnits';        Ct{2,7} = 'points';     % 'points' (default) | 'inches' | 'centimeters' | 'normalized' | 'pixels'
Ct{1,8} = 'FontSmoothing';    Ct{2,8} = 'on';         % 'on' (default) | 'off'
Ct{1,9} = 'Rotation';         Ct{2,9} = 0;            % 0 (default) | scalar value in degrees
% Ct{1,10} = 'FitBoxToText';    Ct{2,10} = 'on';        % 'on' (default) | 'off'
Ct{1,10} = 'EdgeColor';       Ct{2,10} = 'k';         % 'none' (default) | RGB triplet | 'r' | 'g' | 'b' | ...
Ct{1,11} = 'BackgroundColor'; Ct{2,11} = 'c';         % 'none' (default) | RGB triplet | 'r' | 'g' | 'b' | ...
% Ct{1,12} = 'FaceAlpha';       Ct{2,12} = 0;           % 1 (default) | scalar value between 0 and 1 inclusive
Ct{1,12} = 'LineStyle';       Ct{2,12} = '-';         % '-' (default) | '--' | ':' | '-.' | 'none'
% Ct{1,13} = 'FitBoxToText';    Ct{2,13} = 'on';        % 'on' (default) | 'off'
Ct{1,13} = 'LineWidth';       Ct{2,13} = 0.5;         % 0.5 (default) | scalar numeric value
Ct{1,14} = 'Margin';          Ct{2,14} = 3;           % 5 (default) | scalar numeric value
Ct{1,15} = 'Position';        Ct{2,15} = [0.3 0.3 0.1];  % [0.3 0.3 0.1 0.1] (default) | four-element vector
% Ct{1,16} = 'Units';           Ct{2,16} = 'points';   % 'normalized' (default) | 'inches' | 'centimeters' | 'characters' | 'points' | 'pixels'
Ct{1,16} = 'HorizontalAlignment'; Ct{2,16} = 'center'; % 'left' (default) | 'center' | 'right'
Ct{1,17} = 'VerticalAlignment';   Ct{2,17} = 'middle'; % 'top' (default) | 'middle' | 'bottom'
%
% text(x,y, 'Color','r', 'Interpreter','tex', 'FontName','Cambria', ...
%     'FontSize',10, 'FontWeight','normal', 'FontAngle','normal', ...
%     'FontUnits','points');
%
for i=1:21
text(x(i),y(i),num2str(t(i)),Ct{:})
end
%
%% Annotation properties
%% 
% Ca ...

% Line Properties
% Arrow Properties
% DoubleEndArrow Properties
% TextArrow Properties
% TextBox Properties
% Rectangle Properties
% Ellipse Properties
%% 