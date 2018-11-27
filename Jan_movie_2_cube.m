
% read the snapshot 
%% adopted for BHRS test site  %% 

%------- visualization ----------% 

A=-1;
B= 1;

amp1=7000;
amp2=7000;


%-----------------------------------------------------------------%

%--------- CUBE ----------% 

% Time 

snapmax=170;   % Maximum numbe of snapshot 
time=0e-10;    % starting time
TS=5e-10;      % time span


% Dimenstion 
dim_x=500;
dim_y=200;
dim_z=1000;

% test %
Ez1=zeros(400,900);
Ez2=zeros(400,190);
%Ez3=zeros(400,190);

%--------------------- Reading the fields -------------------%
for snap=0:snapmax     % Number of the Snapshots 
    
%% ------------       vertical  xz    -------%% 

nx=400;          %number of the cells in the x direction 
ny=01; 
nz=900;          %number of the cells in the z direction 


z_miror=nz+1;   % for changing it upside down 
  
[Header1,Fields1]=gprmax(sprintf('xzSnap%d.out',snap));  % whole domain     

for x=1:nx         
    for z=1:nz  
                  
    Ez1(x,z) = transpose((Fields1.ez(x,ny,z)));    
 
    end 
end 



x_xz1  = transpose(linspace(50,450,401));
z_xz1  = linspace(50,950,901);


X1=zeros(400,900);
Y1=zeros(400,900);
Z1=zeros(400,900);

for t1=1:400
   X1(t1,:)=x_xz1(t1,:);    
end 

for t1=1:900
   Z1(:,t1)=z_xz1(1,t1);    
end 


for t1=1:200
   Y1(:,:)=100;    
end 

%%  Horizontal 


nx=400;          %number of the cells in the x direction 
ny=190; 
z=01;          %number of the cells in the z direction 


[Header2,Fields2]=gprmax(sprintf('xy2Snap%d.out',snap));  


for x=1:nx         
    for y=1:ny  
                  
    Ez2(x,y) = (Fields2.ez(x,y,z));    
 
    end 
end 

x_xy1  = transpose(linspace(50,450,401));
z_xy1  = linspace(5,195,191);


X2=zeros(400,190);
Y2=zeros(400,190);
Z2=zeros(400,190);

for t1=1:400
   X2(t1,:)=x_xy1(t1,:);    
end 

for t1=1:190
   Y2(:,t1)=z_xy1(1,t1);    
end 


for t1=1:900
   Z2(:,:)=300;    
end 

%% ------------       vertical  layering    -------%% 

nx=400;          %number of the cells in the x direction 
ny=01; 
nz=900;          %number of the cells in the z direction 
      

for x=1:nx         
    for z=1:nz  
                  
    Ez1(x,z) = transpose((Fields1.ez(x,ny,z)));    
 
    end 
end 



x_xz1  = transpose(linspace(50,450,401));
z_xz1  = linspace(50,950,901);


X1=zeros(400,900);
Y1=zeros(400,900);
Z1=zeros(400,900);

for t1=1:400
   X1(t1,:)=x_xz1(t1,:);    
end 

for t1=1:900
   Z1(:,t1)=z_xz1(1,t1);    
end 


for t1=1:200
   Y1(:,:)=100;    
end 



%%    ---------   plot the Ez1   -------- %%
f2=figure;
surf(X1,Y1,Z1,Ez1*amp1,'edgecolor','none')  
    title([' T = ',num2str(time),'s'],'FontSize',11)
    set(f2, 'Position', [1 1 771 774])

    colormap('jet');
    caxis([A B]);
    axis equal;

    
    xticks([0  100  200  300 400 500])
    xticklabels({'0.0','1.0','2.0', '3.0', '4.0', '5.0'})
    
    xlabel('Distance [m]') ;
    yticks([0  50  100 150 200])
    yticklabels({'0.0','0.5','1.0', '1.5', '2.0'})
    ylabel('Distance [m]') ;
    
    
    zticks([0 100 200 300 400 500 600 700 800 900 1000])
    zticklabels({'0.0','1.0','2.0','3.0', '4.0', '5.0', '6.0', '7.0', '8.0','9.0','10.0'})
    zlabel('Depth [m]') ;
    
    hold on 
    
surf(X2,Y2,Z2,Ez2*amp1,'edgecolor','none')  
    
    

%% save the picture  
xyz_cube=sprintf('XYZ_CUBE_EZ_Snap%d',snap);

% savefig(f2,xyz_cube); 
% saveas(f2,xyz_cube,'jpeg');


%% move to next time span 
         
 time=TS+time; % wrting the time of snapshot   
 close all
 
end 
