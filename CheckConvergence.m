function isConverged = CheckConvergence(centerVecs,centerVecsOld,cnt,maxIter)
% function isConverged = CheckConvergence(centerVecs,centerVecsPrev,cnt,maxIter)
% Inputs: centerVecs (nFeat x numClus matrix holding all cluster center
%         vecs), centerVecsOld (matrix of previous best estimate of centers),
%         cnt (number of times algorithm has gone through while loop),
%         maxIter (maximum number of iterations allowed)
% Output: isConverged (logical variable; true if algorithm is converged)

% NOTE - NO WORK NEEDED HERE.  This function is provided to you

% convergeThresh defined as constant (could be added to Par)
convergeThresh = 0.1;

% first, check if max num iter exceeded
if cnt > maxIter 
	isConverged = true;
else
	for k = 1 : size(centerVecs,2)
		delta(k) = ComputeDistance(centerVecs(:,k),...
			centerVecsOld(:,k));
	end
	isConverged =  max(delta) < convergeThresh;
	
end