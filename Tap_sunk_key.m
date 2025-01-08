function [Kd] = Tap_sunk_key(P,N,Ds,Sts,Sc,w,t)
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
% Design for shear strength
L1 = (2.*T)./(w.*Sts.*Ds); % L1 - length of Key
%
% Design for crushing strength
L2 = (4.*T)./(t.*Sc.*Ds);
L = max(L1,L2); % take maximum length
t_top = t+(L./100); % tappered thikness at top
disp('Dimensions of key - (thikness, width, length, top thikness), all in mm, are: ')
Kd = [t,w,L,t_top];
end