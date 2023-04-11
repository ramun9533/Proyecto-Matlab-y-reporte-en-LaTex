close all
clear
clc

% Definir coordenadas del centro de la esfera (el sol) y su radio
center = [0 0 0]; % coordenadas del centro
radius = 5; % radio
t = linspace(0,2*pi,100);
x = cos(5*t);
y = sin(5*t);
z = zeros(1,100);
[xp0, yp0, zp0] = sphere;% Crear matriz de coordenadas de la esfera (el sol)
xp0 = (radius*0.5) * xp0 + center(1);
yp0 = (radius*0.5) * yp0 + center(2);
zp0 = (radius*0.5) * zp0 + center(3);
[xp, yp, zp] = sphere;%Mercurio D = 4879 Km, 88 dias orbita / 4
xp = (radius*0.1) * xp + center(1);
yp = (radius*0.1) * yp + center(2);
zp = (radius*0.1) * zp + center(3);
[xp2, yp2, zp2] = sphere;%Venus D = 12,104 Km, 225 dias / 1.6
xp2 = (radius*0.21) * xp2 + center(1);
yp2 = (radius*0.21) * yp2 + center(2);
zp2 = (radius*0.21) * zp2 + center(3);
[xp3, yp3, zp3] = sphere;%Tierra D = 12, 742 Km, 365 * 1
xp3 = (radius*0.24) * xp3 + center(1);
yp3 = (radius*0.24) * yp3 + center(2);
zp3 = (radius*0.24) * zp3 + center(3);
[xp4, yp4, zp4] = sphere;%Marte 6,779 Km, 687, * .53
xp4 = (radius*0.15) * xp4 + center(1);
yp4 = (radius*0.15) * yp4 + center(2);
zp4 = (radius*0.15) * zp4 + center(3);
psi = 15*pi/180;%15 / 180 = 1 / 12
theta = pi/6;%30 / 180 = 1 / 6
phi = pi/9;%20 / 180 = 1 / 9
R = [cos(phi)*cos(theta) cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi) cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);    sin(phi)*cos(theta) sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi) sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi);    -sin(theta) cos(theta)*sin(psi) cos(theta)*cos(psi)];
p = [5.3*x;2.7*y;z];
p = R*p;
p2 = [15.225*x;14.775*y;z];%Esta variable modifica la figura de e inclinacion de la trauectoria esfera de la orbita
p2 = R*p2;
p3 = [19*x;21*y;z];%Esta variable modifica la figura de e inclinacion de la trauectoria esfera de la orbita
p3 = R*p3;
p4 = [24.48*x;23.52*y;z];%Esta variable modifica la figura de e inclinacion de la trauectoria esfera de la orbita
p4 = R*p4;
for idx=1:length(t);
    figure(1)
    clf
    idx1 =floor(idx*4)+1;%Mercurio (floor promedia hacia abajo)
    idx2 =floor(idx*1.6)+1;%Venus
    idx3 =floor(idx*0.53)+1;%Marte
    plot3(p(1,:),p(2,:),p(3,:),'r')
    hold on
    surf(xp+p(1,idx1),yp+p(2,idx1),zp+p(3,idx1))%Mercurio
    plot3(p2(1,:),p2(2,:),p2(3,:),'k')
    surf(xp2+p2(1,idx2),yp2+p2(2,idx2),zp2+p2(3,idx2))%Venus
    plot3(p3(1,:),p3(2,:),p3(3,:),'g')
    surf(xp3+p3(1,idx),yp3+p3(2,idx),zp3+p3(3,idx))%Tierra
    plot3(p4(1,:),p4(2,:),p4(3,:),'b')
    surf(xp4+p4(1,idx3),yp4+p4(2,idx3),zp4+p4(3,idx3))%Marte
    % Graficar la esfera central (el sol)
    surf(xp0, yp0, zp0, 'FaceColor', [1 1 0], 'EdgeColor', 'none')
    xlim([-35 35])
    ylim([-35 35])
    zlim([-35 35])
    view(50,60)
    pause(0.21)
end
