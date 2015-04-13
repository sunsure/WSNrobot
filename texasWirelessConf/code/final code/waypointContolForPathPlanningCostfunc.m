function waypointContolForPathPlanningCostfunc()
% Based on
% algorithm1, @article{SolteroEtAlIJRR14VoronoiPathPlanning,
%   author = {D. E. Soltero and M. Schwager and D. Rus},
%   title = {Decentralized path planning for coverage tasks using gradient descent adaptive control},
%   journal = {International Journal of Robotics Research},
%   month = {March},
%   year = {2014},
%   volume = {33},
%   number = {3},
%   pages = {401--425}}
%
% Srikanth and Aaron T. Becker
% Date 2/11/2015

%Using the HILBERT CURVE FOR INITIALIZING WAYPOINTS
[x,y] = hilbert(3);
waypointshilbert=20*[x',y'];
waypoints=[0,0;waypointshilbert];

f = figure(10);
set(f,'Name','Cost Function Comparision');
%make out interesting function
szInteresting = 100;
phi = zeros(szInteresting,szInteresting);
%these are interesting!!!
[mX,mY] = meshgrid(linspace(-11,11,szInteresting),linspace(-11,11,szInteresting)); %making the grid
cellsz = mY(2) - mY(1);
sensors=[0,0;-2,2;2,2;-2,-2;2,-2;-6,6;-8,8;-4,8;-8,4;-4,4;6,-6;8,-8;4,-8;8,-4;4,-4;-10,-10;10,10;-8,-10;-10,-8;8,10;10,8];%Intresting points
for m = 1:size(sensors,1)
    h = .5;
    phi=phi+TransmissionCost(h,sensors(m,1), sensors(m,2),6, mX, mY);
end
costfunc=[];
for iter = 1:200
    H1=[waypoints(:,1),waypoints(:,2)];
    % here for these iterations we calculate the previous and next neighbour for each waypoint
    pim=[waypoints(end,:);waypoints(1:end-1,:)];
    pip=[waypoints(2:end,:);waypoints(1,:)];
    
    nwaypts = size(waypoints,1);
    M_vals = zeros(size(waypoints,1),1); %mass
    L_vals = zeros(size(waypoints,1),2); %first mass moment
    C_vals = zeros(size(waypoints,1),2); %centroids
  
    indExciting = find(phi>0); %index of every 'exciting point'
      minCosts = zeros(size(indExciting));
    for m = 1:numel(indExciting)  % iterate through every grid point that is 'exciting'
        indx = indExciting(m);
        pos = [mX(indx)+cellsz/2,mY(indx)+cellsz/2];  %center of grid cell is [mX,mY] + 1/2[cellsize,cellsize], pos is the center of the interesting gridcell
        
        %squared distance between this grid cell and every waypoint
        sumSqDist = sum((repmat(pos,nwaypts,1) - waypoints).^2,2);
        [minDist,minIndx] = min(sumSqDist);
        minCosts(m) =  minDist^2*phi(indx);
        M_vals(minIndx) = M_vals(minIndx)+phi(indx); %calculate the mass
        L_vals(minIndx,:) = L_vals(minIndx,:)+pos*phi(indx); %calcuate the mass
    end
    %calculate errors between ccentroid and desired position
    e_vals = zeros(size(waypoints,1),2);
    C_vals = L_vals./[M_vals,M_vals];
    
    %for i= mod(iter,nwaypts)+1                   %errors
    for i=   1:nwaypts        %errors
        
        if isnan(C_vals(i,1))
            e_vals(i,:)=[0,0];
        else
            e_vals(i,:)= C_vals(i,:) - H1(i,:);
        end
        
    end
    
    Wn=1;
    alpha_vals=zeros(size(waypoints,1),2);
    beta_vals=zeros(size(waypoints,1),1);
    uir =zeros(size(waypoints,1),2);
    
    for i = 1:nwaypts
        alpha_vals(i,:)=Wn*(pim(i,:)+pip(i,:)-2*H1(i,:));
        beta_vals(i,1)=M_vals(i,:)+(2*Wn);
    end
    % moving towards the centeroid of the voronoi cells
    Ki=1; %potentially -time varying positive definite matrix
    for i = 1:nwaypts
        if(H1(i,1)==-1.2500&&H1(i,2)==-1.2500)
            uir(i,:)=[0 0];
        end
        uir(1,:) = [0,0];
        uir(nwaypts/2+1,:) = [0,0];
        uir(i,:)=Ki.*((M_vals(i,:).*e_vals(i,:))+alpha_vals(i,:))/beta_vals(i,1); %Control input based on gradient descent
    end
    %apply control input
    deltat=0.1; %time period
    waypoints=waypoints+uir*deltat; %updating waypoints
    Ws=1;
P=(Ws/2*(sum(minCosts))+sum(Wn/2*((waypoints(:,1)-pip(:,1)).^2)+((waypoints(:,2)-pip(:,2)).^2)));
costfunc = [costfunc;P]; 
    
end

disp(size(costfunc));
d=1:200;
h1 = plot(d,costfunc,'b');
hold on;
title 'Comparing COST FUNCTION for Waypoint Control with and without MTSPF';
xlabel 'ITERATION NUMBER';
ylabel 'COST FUNCTION';
h2 = waypointContolForPathPLanningCostfuncwithMTSP();
legend ([h1;h2],'Without MTSPF','With MTSPF');

end