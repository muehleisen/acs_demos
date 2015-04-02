% MATLAB script to generate an AVI of an acoustic plane wave
% @ Ralph Muehleisen, 2006
% 
%
% This script generates an AVI animation of an acoustic plane wave.
% The top part of the animation shows some random particles and their displacement
% Where the particles are close together is an acoustic compression.  Where the 
% particles are far apart is an acoustic rarefaction
%
% Beneath the particle animation is a plot of the acoustic pressure or particle 
% velocity of the plane wave (the only difference is a scale factor)



% set number of particles
N=2500;

% set the tube length and width to unity
L=1;
W=1;

% set the wavelength to be 1/4 tube length
lambda=L/4;

% set amplitude to be L/10
A=L/20;

% set speed of sound equal to 1 m/s
c=1;

% do 10 frames
Nframes=14;

% set up plane wave to have 4 peaks - it seems best for display
lambda=1/3;
f=c/lambda;
T=1/f;
k=2*pi/lambda;

w=2*pi*f;
t=linspace(0,T,Nframes);

% generate the random particle positions
x=rand([N,1])*L;
y=rand([N,1])*W;

% create figure and size axes so we can get the geometry
% size for the movie
subplot(2,1,1)
axis([-L/10,L,0,W])
subplot(2,1,2)
axis([-L/10,L,-1,1])

% do a bunch of stupid stuff MATLAB says to do when creating movies
rect=get(gcf,'Position');
rect(1:2)=[0 0];
set(gca,'Nextplot','replacechildren');
set(gcf,'color','white')

h=plot(x,y,'k.','markersize',4.0);
for I=1:Nframes
    % compute particle displacement for plane wave
    % if pressure is a cos, then velocity is a cos
    % and displacement must be a -sin
    dx=-A*sin(k.*x-w.*t(I));
	subplot(2,1,1)
	h=plot(x+dx,y,'k.','markersize',4.0);
    axis([-L/10,L,0,W])

    % now compute and plot the piston box
    px=-L/20*sin(-w*t(I));
    h=patch([px;px;px-A/2;px-A/2],[0;1;1;0],'k');
    
    % plot the lines that represent the tube
    % turn off clipping so they show up full width
    h=line([-L/10,L],[0,0]);
    set(h,'color','k','linewidth',2,'clipping','off')
    h=line([-L/10,L],[W,W]);
    set(h,'color','k','linewidth',2,'clipping','off')
    
    title('Traveling Plane Wave')
    axis off
    
    
    % generate points for pressure plot starting at the edge of the piston
	l=linspace(-A*sin(-w*t(I)),L,100);

    % compute pressure
	p=cos(k.*l-w.*t(I));

    % plot pressure
    subplot(2,1,2)
    plot(l,p,'k-')
    
    % plot piston
    px=-L/20*sin(-w*t(I));
    patch([px;px;px-A/2;px-A/2],[-1;1;1;-1],'k');
    axis([-L/10,L,-1,1])

    % turn off axes tick marks
    set(gca,'Xtick',[])
    set(gca,'Ytick',[])
    
    % label pressure max and min
    text(-L/6,1,'Max')
    text(-L/6,-1,'Min')
    
    xlabel('@ Ralph Muehleisen, 2006')
    ylabel('Pressure/Velocity');

    % actually get the movie frame and save it to the movie
    F(I)=getframe(gcf,rect);
  
end

%movie(gcf,F,1)

[filename,pathname]=uiputfile('planewave.avi');
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
