% MATLAB script to generate an AVI of a spherical acoustic wave
% @ Ralph Muehleisen, 2001
% 
%
% This script generates an AVI animation of an acoustic spherical wave.
%
%
% The top part of the animation shows a particle grid and its displacement
% Where the particles are close together is an acoustic compression.  Where the 
% particles are far apart is an acoustic rarefaction
%
% Beneath the particle animation is a plot of the acoustic pressure of 
% the spherical wave


R=1;
A=R/20;
Nframes=14;

lambda=0.25*R;
c=1;
f=c/lambda;
T=1/f;
k=2*pi/lambda;

w=2*pi*f;
t=linspace(0,T,Nframes);


% create grid for showing waves (rectangular grid looks beter than
% random grid for this case.
x=linspace(-R,R,80);
y=linspace(0,R,50);


%x=(rand([50,1])-0.5)*2*R;
%y=(rand([25,1])-0.5)*2*W;

%x=rand([1,60])*2*R - R;
%y=rand([1,30])*R;

[X,Y]=meshgrid(x,y);

% convert x,y positions into spherical coordinates
[theta,r]=cart2pol(X,Y);

%r=sqrt(X.^2+Y.^2);
%theta=atan2(Y,X);

% create figure and size axes for movie
subplot(2,1,1)
axis([-R,R,0,R])
subplot(2,1,2)
axis([-R,R,-10*A,10*A])

% do MATLAB voodoo for setting up movie
rect=get(gcf,'Position');
rect(1:2)=[0 0];
set(gca,'Nextplot','replacechildren');

set(gcf,'color','white')

% plot first frame to get figure size set properly 
[xd,yd]=pol2cart(theta,r);
subplot(2,1,1)
h=plot(xd,yd,'k.','markersize',2);   

for I=1:Nframes

	dr=A*sin(k.*r-w.*t(I))./r;
       
    % compute the displaced x and y positions of the particles
    [xd,yd]=pol2cart(theta,r+dr);
    
    % plot the displaced particles
	subplot(2,1,1)
    h=plot(xd,yd,'k.','markersize',2);
    axis([-R,R,0,R])
 
    title('Acoustic Monopole')
    set(gca,'Xtick',[])
    axis equal
    axis([-R,R,0,R])
    axis off

    % create distance vector for pressure plot
   	r0=linspace(0,R,100)+eps;

    % compute pressure
 	p=-A*cos(k.*r0-w.*t(I))./r0;

    % plot pressure  
   	subplot(2,1,2)
 	plot(r0,p,'k-',-r0,p,'k-')
    axis([-R,R,-10*A,10*A])
    set(gca,'Xtick',[])
    set(gca,'Ytick',[])
    text(-15,1,'Max')
    text(-15,-1,'Min')

    xlabel('@ Ralph Muehleisen, 2006')
    ylabel('Acoustic Pressure');

    F(I)=getframe(gcf,rect);
 %   mov=addframe(mov,Frame);
end


[filename,pathname]=uiputfile('spherewave.avi');
if isequal(filename,0)
    break
end

filename=[pathname,filename];

if exist(filename)
    delete(filename)
end

% convert the movie to an avi and save the file using high quality and no
% compression to reduce compression artifacts.  Save at a 7 fps frame rate
% so we can see the animation

movie2avi(F,filename,'compression','none','quality',100,'fps',7)

