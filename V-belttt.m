clc
clear
%% V-belt design 
%Function[DP]=V_belt(CA,L,C)
%Reference-
%INPUT:CA-contact angle,L-length,C-center distance,i-speed ratio,Tr-tension
% ratio,power,angular speed(rpm),D1-belt density(k.g/m^3),BP-belt
% parameters
%OUTPUT:DP-design parameters
%%Types of V-belt,V_type
V_type = {'Conventional','double V- belt','Adjustable-speed V-belt'};
prompt1='Select type of V-belt:';
Bname='V-belt design:';
Bsize=[300,100];
[indx1,tf1]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt1,'SelectionMode','single','ListString',V_type);
%Belt materials,BMtype
BMtype={'Leather','Convass','Rubber','Balata','Single woven belt','Double woven belt'};
prompt2='Select belt material:';
Bname='Belt materials:';
Bsize=[300,100];
[indx2,tf2]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt2,'SelectionMode','single','ListString',BMtype);
% Density of belt materials
if indx2==1
    D1=1000;
elseif indx2==2
    D1 = 1220;
elseif indx2==3
    D1 = 1140;
elseif indx2==4
    D1 = 1110;
elseif indx2==5
    D1 = 1170;
elseif indx2==6
    D1 = 1250;
end 
% Belt cross section,BCStype
 indx1==1
    BCStype={'HA','HB','HC','HD','HE'};
    prompt3='Select belt cross section type:';
    Bname='Belt cross section:';
    Bsize=[300,100];
    [indx3,tf3]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt3,'SelectionMode','single','ListString',BCStype);
% Belt parameters,BP
%BP=[W D A OD],W-nominal belt width(mm),D-nominal belt depth(mm),A-sheave groove
%angle(degree),OD-effective OD minus PD for Std -groove sheave(mm)
BP1=[12.7 7.9 30-38 6.35
     16.7 10.3 30-38 8.89
     22.2 13.5 30-38 10.16
     31.8 19.0 30-38 15.24
     38.1 23.0 32-38 20.32];
 %
 [m,n]=size(BP1);
 for i=1:m 
 if  indx3==1
 W=BP1(1,1);D=BP1(1,2);A=BP1(1,3);OD=BP1(1,4);
 elseif  indx3==2
     W=BP1(2,1);D=BP1(2,2);A=BP1(2,3);OD=BP1(2,4);
 elseif indx3==3
      W=BP1(3,1);D=BP1(3,2);A=BP1(3,3);OD=BP1(3,4);
 elseif indx3==4
      W=BP1(4,1);D=BP1(4,2);A=BP1(4,3);OD=BP1(4,4);
 elseif indx3==5
      W=BP1(5,1);D=BP1(5,2);A=BP1(5,3);OD=BP1(5,4);
 end
 if indx1==2
    BCStype={'HAA','HBB','HCC','HDD'};
    prompt4='Select belt cross section type:';
    Bname='Belt cross section:';
    Bsize=[300,100];
  [indx4,tf4]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt,'SelectionMode','single','ListString',BCStype);
BP2=[12.7 10.3 30-38 6.35
      16.7 13.5 30-38 8.89
      22.2 17.5 30-38 10.16
      31.8 25.4 30-38 15.24];
  %
  [m,n]=size(BP2);
  for i=1:m 
 if indx4==1
 W=BP2(1,1);D=BP2(1,2);A=BP2(1,3);OD=BP2(1,4);
 elseif indx4==2
     W=BP2(2,1);D=BP2(2,2);A=BP2(2,3);OD=BP2(2,4);
 elseif indx4==3
      W=BP2(3,1);D=BP2(3,2);A=BP2(3,3);OD=BP2(3,4);
 elseif indx4==4
      W=BP2(4,1);D=BP2(4,2);A=BP2(4,3);OD=BP2(4,4);
  end
 indx1==3
    BCStype={'HI','HJ','HK','HL','HM'};
    prompt5='Select belt cross section type:';
    Bname='Belt cross section:';
    Bsize=[300,100];
    [indx5,tf5]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt5,'SelectionMode','single','ListString',BCStype);
  BP3=[25.4 12.7 26 7.6
       31.8 15.0 26 9.4
       38.1 17.5 26 11.4
       44.4 19.8 26 13.2
       50.8 22.2 26 15.2];
   %
   [m,n]=size(BP3);
 for i=1:m 
 if  indx5==1
 W=BP3(1,1);D=BP3(1,2);A=BP3(1,3);OD=BP3(1,4);
 elseif indx5==2
     W=BP3(2,1);D=BP3(2,2);A=BP3(2,3);OD=BP3(2,4);
 elseif indx5==3
      W=BP3(3,1);D=BP3(3,2);A=BP3(3,3);OD=BP3(3,4);
 elseif indx5==4
      W=BP3(4,1);D=BP3(4,2);A=BP3(4,3);OD=BP3(4,4);
 elseif indx5==5
      W=BP3(5,1);D=BP3(5,2);A=BP3(5,3);OD=BP3(5,4);
 end
 end 
 end
 end
 end
%Dimension of standard V-velt,DSV
% DSV=[P Dp b t W],P-belt power(KW),Dp-pitch diameter of pinion pulley(mm),b-top
% width of belt(mm),t-thickness of belt(mm),W-weight of belt per length(N/m)
DSV=[3.5 75 13 8 1.06
     15 125 17 11 1.89
     75 200 22 14 3.43
     15 355 32 19 5.96
     350 500 38 23 0];
 [k,q]=size(DSV);
 for j=1:q 
     if indx1==1 && indx3==1
         P=DSV(1,1);Dp=DSV(1,2); b=DSV(1,3);t=DSV(1,4);W=DSV(1,5);
 elseif indx1==1 && indx3==2
        P=DSV(2,1);Dp=DSV(2,2);b=DSV(2,3);t=DSV(2,4);W=DSV(2,5); 
 elseif indx1==1 && indx3==3
        P=DSV(3,1);Dp=DSV(3,2);b=DSV(3,3);t=DSV(3,4);W=DSV(3,5); 
 elseif indx1==1 && indx3==4
        P=DSV(4,1);Dp=DSV(4,2);b=DSV(4,3);t=DSV(4,4);W=DSV(4,5); 
 elseif indx1==1 && indx3==5
        P=DSV(5,1);Dp=DSV(5,2);b=DSV(5,3);t=DSV(5,4);W=DSV(5,5);
     end
 end
% d2-pitch diameter of large pulley
%i-speed ratio b/n pinion and large pulley
i=input('enter the speed ratio value:')
d2=i*Dp;
%Center distance range
Cmin=0.7*(Dp+d2);%Cmin minimum value
Cmax=2*(Dp+d2);%maximum value
Cave=(Cmin+Cmax)/2;% average value of center distance
% Belt length,L(mm)
L=2*Cave+0.5*pi*(d2+Dp)+1/(4*Cave)*(d2-Dp)^2;
% Standard belt length,Ls
%Ls=[A B C D E],A-type velt,B-type,C-type,D-type,E-type
%L1-standard belt length
Ls=25.4.*[27.3 0 0 0 0
    36.3 36.8 0 113.3 0
    43.3 43.8 0 147.3 0
    52.3 52.8 53.9 161.3 0
    61.3 61.8 62.9 173.3 0
    69.3 69.8 70.9 183.3 184.4
    76.3 76.8 77.9 213.3 214.5
    86.3 86.8 87.9 240.8 241.0
    91.3 91.8 92.9 270.8 271.0
    106.3 106.8 107.9 300.8 301.0
    113.3 113.8 114.9 0 0
    121.3 121.8 122.9 0 0
    0 145.8 146.9 0 0
    0 159.8 160.9 0 0
    0 174.8 175.9 0 0
    0 181.8 182.9 0 0
    0 211.8 212.9 0 0
    0 240.3 240.9 0 0
    0 270.3 270.9 0 0
    0 300.3 300.9 0 0];
[m,n]=size(Ls);
for  i=1:m-8
    if indx1==1 && indx3==1 && L<Ls(1,1)
          L1=Ls(1,1);
    elseif indx1==1 && indx3==1 && L<Ls(i+1,1)&& L>Ls(i,1)
         L1=Ls(i+1,1);
    end
end
for i=2:m
  if indx1==1 && indx3==2 && L<Ls(2,2)
       L1=Ls(2,2);
      elseif L>Ls(i,2)&& L<Ls(i+1,2)
          L1=Ls(i+1,2); 
  end
end
for i=4:m 
    if indx1==1 && indx3==3 && L<Ls(4,3)
       L1=Ls(4,3) 
     elseif L>Ls(i,3)&& L<Ls(i+1,3)
         L1=Ls(i+1,3);
    end
end
for i=2:m-11
if indx1==1 && indx3==4 && L<Ls(2,4)
        L1=Ls(2,4) 
     elseif L>Ls(i,4)&& L<Ls(i+1,4)
         L1=Ls(i+1,4);
end
end
for i=6:m-10
 if indx1==1 && indx3==5 && L<Ls(6,5)
        L1=Ls(6,5) 
     elseif L>Ls(i,5)&& L<Ls(i+1,5)
         L1=Ls(i+1,5);
 end
end
% from the standard belt length(Ls)let's find the standard center distance
% of belt(Cs)
%Ls=2*Cs+0.5*pi*(d2+Dp)+1/(4*Cs)*(d2-Dp)^2
%P=8Cs1^2-(Ls-pi/2*(d2+Dp)*4)*Cs1+(d2-Dp)^2,polynomial function 
a1=8;%leading coefficient of the second ordeer polynomial term
b1=(L1-2*pi*(d2+Dp));%coefficient of the first order polynomial 
c1=(d2-Dp)^2;%constant value of the polynomial
P=[1 -556.135 8613.28];
Cs1=roots(P)
Cs=max(Cs1);
%Contact angle of pulley(a1 and a2)
%a1-contact angle of pinion pulley in degree
%a2-contact angle of large pulley in degree
a1=180-(2*asind((d2-Dp)*0.5/Cs));
a2=180+(2*asind((d2-Dp)*(0.5/Cs)));
%Kt=[a1 r1],r1=T1/T2-tension ratio
Kt=[180 5.00
    175 4.78
    170 4.57
    165 4.37
    160 4.18
    155 4.00
    150 3.82
    145 3.66
    140 3.50
    135 3.34
    130 3.20
    125 3.06
    120 2.92
    115 2.80
    110 2.67
    105 2.56
    100 2.44
    90 2.24];
[m,n]=size(Kt)
for i=1:m-1
    if a1==Kt(i,1)
        r1=Kt(i,2);
    elseif a1<Kt(i,1)
        r1=Kt(i,2);
    elseif a1>Kt(i,1)&& a1<Kt(i+1,1)
    r1=Kt(i+1,2);
    end
end
P=input('enter the value of P in KW:');,%P-rated power in KW
CB=input('enter the value of CB :');%CB-service factor
V=input('enter the value of V in m/s:');%V-belt tangential speed in m/s
Pd=CB*P; %Pd-design power
T2=Pd*1000/(V*(r1-1));
T1=r1*T2;
%% Pulley design
%pulley materials,PM
PM={'Aluminim','Steel','Cast iron','Wooden','Paper'};
prompt6='Select Puley material:';
Bname='Pulley materials:';
Bsize=[300,100];
[indx6,tf6]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',prompt6,'SelectionMode','single','ListString',PM);
%% Pulley parameters,Pp
% Pulley arms,n-for pinio,k-for large pulley
if Dp<200;%Dp-pinion pulley diameter in mm
    n=0;% mean that the pulley is solid disc
elseif 200<Dp<600
    n=4;
elseif 600<Dp<1500
    n=6;
end
if d2<200;%d2-large pulley diameter in mm
    k=0;% mean that the pulley is solid disc
elseif 200<d2<600
    k=4;
elseif 600<d2<1500
    k=6;
end
%Pulley face width,B 
  B=1.25*b;
  % Thickness of pulley,Tp
  Tp={'Single belt','Duoble belt'};
  Prompt7='Select the type of belt:';
  Bname='Type of belt:';
  Bsize=[300,100];
 [indx7,tf7]=listdlg('Name',Bname,'ListSize',Bsize,'PromptString',Prompt7,'SelectionMode','single','ListString',Tp);
  if indx7==1
    t1=0.5*(((Dp/300)+2)+((Dp/200)+3))%is thickness of pinion pulley in mm
    t2=0.5*(((d2/300)+2)+((d2/200)+3))%is thickness of Large pulley in mm
  elseif indx7==2
      t1=(Dp/200)+6;
      t2= (d2/200)+6;
     end


