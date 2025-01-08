clear all;
clc;
clear all;
%% Design of pair roller%%
Acorn=input('enter the value of Acorn:');% corn crop crossectional area 
Smin=input('eneter the valeu of Smin:');%minimum shear stress of crop
Smin=3.02;%Shear min of corn
Dcorn=(4*Acorn/pi)^0.5
Fmin=Smin*Acorn; %min compressive force of roller
%%Design of rotary Chopper%%
L=input('enter the value of  L:')% length of  blade
W=input('enter the value of W:')% width of blade
t=input('enter the value of t:')
d=input('enter the value of d:')%density of the hardest stover material
Smax=21.7;%Shear strenght of Soybean
Ahard=23.64;
Sdesign=Smax+0.25*Smax
Fcutter=Sdesign*Ahard %cutting force of chopper
Dhard=(4*Ahard/pi)^0.5
Vc=L*W*t
Mc=d*Vc
Dc=(8*Fcutter/pi*Sdesign)^0.5
wc=(Sdesign*Ahard/Mc*0.5*Dc)^0.5% angular speed in rad/sec%
N=60*wc/2*pi;% angular speed of blade in rpm
Pchopper=Fcutter*wc*0.5*Dc;%the power required to cut the stover

%% Design of Hammer%%
NH=input('enter the value of NH:')
MH=input('enter the value of  MH:')
Nh=input('enter the value of Nh:')
FH=Sdesign*Ahard;%cutting force of stovver
wH=2*pi*Nh/60 %angular speed  of hammer in rad/sec
rH=FH/NH*MH*wH^2 % radius of hammer
PH=FH*wH*rH % required power of the hammer
