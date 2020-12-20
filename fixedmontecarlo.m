count = 0; % Number of darts that fell inside of the circle.
darts = 1e8;
R = 1;

poolObj=parpool(8);         
disp(poolObj);
parfor i = 1:darts
	% Compute the X and Y coordinates of where the dart hit the
	% square using uniform distribution.
	x = R*rand(1);
	y = R*rand(1);
	if x^2 + y^2 <= R^2
		% Increment the count of darts that fell inside of the
		% circle.
		count = count + 1;
	end
end

% Compute PI using the ratio of darts that fell inside of
% the circle to the total number of darts thrown.
myPI = 4*count/darts;
delete(poolObj);
disp(myPI);
