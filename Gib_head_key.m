function [Gh] = Gib_head_key(P,N,Ds,Sts,Sc)
% Function Tap_sunk_key calculates the dimensions of a tappered sunk key
% Modified by Alem Barai
% date modified Feb 17, 2022
%
% Input: Ds - Shaft diameter (m) P - power (Kw), N - shaft revolution
% (rpm), Sts & Sc - shear and crushing strength of key material, w - width
% of key, t - thikness of key
% output: Kd - key dimensions, [t, w, L, t_top]
T = (P.*10.^6.*60)/(2.*pi.*N); % torque
%
%Width of key
wk=Ds/4;
%Thickness of key
tk=Ds/6;
%Thickness of head
th=1.75*tk;
%width of head
wh=1.5*tk;
%Depth of head
b=wh-((0.75*tk)/tan(45));
% Design for shear strength
L1 = (2.*T)./(wk.*Sts.*Ds); % L1 - length of Key
%
% Design for crushing strength
L2 = (4.*T)./(tk.*Sc.*Ds);
L = max(L1,L2); % take maximum length
%Total tength of gib key
LT=L+wh;
t_top = tk+(L/100); % tappered thikness at top
disp('Dimensions of key - (thikness, width, length,thickness head,width head,depth head, top thikness), all in mm, are: ')
Gh = [tk,wk,LT,th,wh,b,t_top];
end