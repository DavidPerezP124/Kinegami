% Cut graphing - Fold Type C
% Last edited 6/9/2021 by Lucien Peach

function [dataFoldDefault, m, lmax] = Default_papercut(n, ls, h, r)

% Counter used for data structure indexing
count = 1;

% Identify colors
% red = [1, 0, 0];
black = [0, 0, 0];
blue = [0, 0, 1];

% Begin by defining left and right sides of sheet
% -------------------------------------------------------------------

% Left side
leftboundaryx = [0; 0];
leftboundaryy = [0; h];

% Log data to structure and add to plot
dataFoldDefault(count).x = leftboundaryx;
dataFoldDefault(count).y = leftboundaryy;
dataFoldDefault(count).color = black;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)
hold on
set(gcf, 'color', 'w')

% Increase count
count = count + 1;

% Right side
rightboundaryx = [n*ls; n*ls];
rightboundaryy = [0; h];

% Log data to structure and add to plot
dataFoldDefault(count).x = rightboundaryx;
dataFoldDefault(count).y = rightboundaryy;
dataFoldDefault(count).color = black;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)

% Increse count
count = count + 1;

% Define top and bottom edges of sheet (proximal and distal, in red)
% -------------------------------------------------------------------

% Top edge
topboundaryx = [0; n*ls];
topboundaryy = [h; h];

% Log data to structure and add to plot
dataFoldDefault(count).x = topboundaryx;
dataFoldDefault(count).y = topboundaryy;
dataFoldDefault(count).color = black;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)

% Increase count
count = count + 1;

% Right side
bottomboundaryx = [0; n*ls];
bottomboundaryy = [0; 0];

% Log data to structure and add to plot
dataFoldDefault(count).x = bottomboundaryx;
dataFoldDefault(count).y = bottomboundaryy;
dataFoldDefault(count).color = black;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)

% Specify vertical line pattern
% ------------------------------------------------------------------

% Increase counter
count = count + 1;

% Log data to structure and add to plot
dataFoldDefault(count).x = leftboundaryx;
dataFoldDefault(count).y = leftboundaryy;
dataFoldDefault(count).color = blue;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)

% Increase count
count = count + 1;

% Log data to structure and add to plot
dataFoldDefault(count).x = rightboundaryx;
dataFoldDefault(count).y = rightboundaryy;
dataFoldDefault(count).color = blue;

plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
    dataFoldDefault(count).color)

% Tube folds and graphing
tube = zeros(2*(n-1), 2);

% Ignore side folds as these are graphed by the boundary section
for i = 1:2:2*(n-1)
    
    % Increase count initially
    count = count + 1;
    
    % Indexing 
    index = ((i-1)/2) + 1;
    
    % Populate array
    tube(i, 1) = index*ls;
    tube(i, 2) = 0;
    tube(i+1, 1) = index*ls;
    tube(i+1, 2) = h;
    
    % Log data to structure and add to plot. Plotting is sequential
    dataFoldDefault(count).x = tube(i:i+1, 1);
    dataFoldDefault(count).y = tube(i:i+1, 2);
    dataFoldDefault(count).color = blue;

    plot(dataFoldDefault(count).x, dataFoldDefault(count).y, 'color', ...
        dataFoldDefault(count).color)
end

% Label the plot for clarity
title({
    ('Default Origami Schematic for Provided Parameters:')
    ['[r = ' num2str(r) ', n = ' num2str(n) ', h = ' num2str(h) ']']
    })

daspect([1 1 1])

m = 0;
lmax = h;

close all

end