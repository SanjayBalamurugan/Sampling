clc;
close all;

smpl = slicesamples(5,10); % No of Samples in each slices & Defining No of slices

x = -3:0.1:3;
y = normpdf(x,0,1);
figure;
plot(x,y)

function p = func(x) % Defining the function
    p = normpdf(x,0,1);
end

function smpl = slicesamples(size,number)

smpl = []; % Initialising an 
w = 0.01*rand(1,size); % Defining the width parameter
u = 0.1; % Choosing the initial value
x = zeros(1,size);

for i = 1:number
smpl(i,:) = x; % first we are assigning all values as 0
p = func(x); 
up = rand(1,1)*p; 
r = rand(1,1); % generating random number between 0 and 1
xl = x - r*w; % finding left extreme of slice
xr = x + (1-r)*w; % finding right extreme of slice

while (func(xl) > u) % finding the correct left extreme
    xl = xl - w;
end
while (func( xr) > u) % finding the correct right extreme
    xr = xr + w;
end

xp = rand(1,1)*(xr-xl) + xl;
while(func(xp) < up)
    xp = rand(1,1)*(xr-xl) + xl;
    if func(xp) > up
        break;
    else
        if xp>x 
            xr = xp;
        else
            xl = xp;
        end
    end
end
x = xp;
u = up;
end
end