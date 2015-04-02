% MATLAB script to generate an AVI of an acoustic standing wave
% @ Ralph Muehleisen, 2001
% 
%
% This script generates an AVI animation of an acoustic standing wave.
% The top part of the animation shows some random particles and their displacement
% Where the particles are close together is an acoustic compression.  Where the 
% particles are far apart is an acoustic rarefaction
%
% Beneath the particle animation is a plot of the acoustic pressure


%prompt={'Traveling (t) or Standing

sg=+1;  % make this a traveling wave superposition        
%beta=input('What is the phase shift (in radians)');
%amp=input('What is the relative amplitude(as a decimal)');

% set up two plane waves 90 degrees out of phase with differing amplitudes
beta=pi/2;
amp=1;

    

% set number of particles
N=2000;

% set the tube length and width to unity
L=1;
W=1;

% set the wavelength to be 1/4 tube length
lambda=L/4;

% set amplitude to be L/50
A=L/50;

% set speed of sound equal to 1 m/s
c=1;
Nframes=14;

%lambda=1/3;
f=c/lambda;
T=1/f;
k=2*pi/lambda;

w=2*pi*f;
t=linspace(0,T,Nframes);

x=rand([N,1])*L;
y=rand([N,1])*W;


%l=linspace(-A*sin(-w*t(I)),L,100);

subplot(3,2,1)
axis([0,L,0,W])
subplot(3,2,2)
axis([0,L,0,W])
subplot(3,2,3)
axis([0,L,0,W])


rect=get(gcf,'Position');
rect(1:2)=[0 0];
set(gca,'Nextplot','replacechildren');

set(gcf,'color','white')


plot(x,y,'k.','markersize',3);

for I=1:Nframes
    
    % compute and plot plane wave going right
    dxr=A*sin(k.*x-w.*t(I));
    subplot(3,2,1)
    plot(x+dxr,y,'k.','markersize',2);
    axis([0,L,0,W])

    % plot the lines that represent the tube walls
    line([0,L],[0,0],'color','k','linewidth',2,'clipping','off')
    line([0,L],[W,W],'color','k','linewidth',2,'clipping','off')
    
    tstring=sprintf('Superposition of Two Plane Waves in Same Direction is a Another Plane Wave');  %e direction with \\beta=%3.2f  and p1/p2=%2.1f',beta,amp)
    text(1.2,1.2,tstring,'clipping','off','horizontalalignment','center');
    axis off
    
    % compute and plot plane wave going to right with a pi/4 phase shift
    dxl=A.*amp*sin(k.*x - sg.* w.*t(I)+ beta);
	subplot(3,2,3)
	h=plot(x+dxl,y,'k.','markersize',3);
    axis([0,L,0,W])
    axis off
    

    % plot the lines that represent the tube walls
    line([0,L],[0,0],'color','k','linewidth',2,'clipping','off')
    line([0,L],[W,W],'color','k','linewidth',2,'clipping','off')

    % sum displacement to compute standing waves and plot
	subplot(3,2,5)
	h=plot(x+dxr+dxl,y,'k.','markersize',3);
    axis([0,L,0,W])
    axis off

     % plot the lines that represent the tube walls
     line([0,L],[0,0],'color','k','linewidth',2,'clipping','off')
     line([0,L],[W,W],'color','k','linewidth',2,'clipping','off')

     text(1.2,-0.3,'@ Ralph Muehleisen, 2006', ...
         'clipping','off','horizontalalignment','center');
    axis off

    
    % plot the first pressure wave going to the right
    x0=linspace(0,L,100);
    pr=-cos(k.*x0-w.*t(I));
    subplot(3,2,2)
    plot(x0,pr,'k-')
    axis([0,L,-2,2])
    set(gca,'Xtick',[])
    set(gca,'Ytick',[])
    text(-L/6,1,'Max')
    text(-L/6,-1,'Min')
    ylabel('p');
    grid on
    
    pl=-amp.*cos(k.*x0-sg.*w.*t(I)+beta);
    subplot(3,2,4)
    plot(x0,pl,'k-')
    axis([0,L,-2,2])
    set(gca,'Xtick',[])
    set(gca,'Ytick',[])
    text(-L/6,1,'Max')
    text(-L/6,-1,'Min')
    ylabel('p');

 	p=(pr+pl);
    subplot(3,2,6)
    plot(x0,p,'k-')
    axis([0,L,-2,2])
    set(gca,'Xtick',[])
    set(gca,'Ytick',[])
    text(-L/6,1,'Max')
    text(-L/6,-1,'Min')
    ylabel('p');

    %xlabel('@ Ralph Muehleisen, 2005')
    %ylabel('Pressure/Velocity');
	%M(:,I)=getframe(gcf,rect);
 
 %   mov=addframe(mov,Frame);
    %mov=addframe(mov,H);
    
    F(I)=getframe(gcf,rect);
end

%movie(gcf,F,1);

[filename,pathname]=uiputfile('superposition.avi');
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
