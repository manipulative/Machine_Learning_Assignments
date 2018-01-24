function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



%% Important, for both J and grad, do not use theta(1) !!!

% Should not count theta(1), so use theta(2:length(theta))
J = -1 / m * sum(y .* log(sigmoid(X * theta)) + (1-y) .* log(1 - sigmoid(X * theta))) + lambda / (2*m) * sum(theta(2:length(theta)) .^ 2); 
grad = (1 / m) .* X' * (sigmoid(X * theta) - y) + lambda / m * theta; % j >= 1

% First way to calculate grad, calculate seperately
% X(:,1) is the first column, corrsponding to x_{j}, j=0
grad(1) = (1 / m) .* sum(X(:,1)' * (sigmoid(X * theta) - y));

% Second way, substract for j=0 (theta(1))
% grad(1) = grad(1) - lambda / m * theta(1); % j = 0

% fprintf('Cost at initial theta (zeros): %f\n', J);
% fprintf(' %f \n', grad(1:10));



% Third way,for both J and grad
% [J1, grad] = costFunction(theta, X, y);
% theta_leave_first_out = [0; theta(2:length(theta));]; % set first ele to 0
% J1 = J1 + lambda / (2 * m) * sum(theta_leave_first_out .^ 2 );
% grad = grad + (lambda / m) * theta_leave_first_out;

% fprintf('Cost at initial theta (zeros): %f\n', J1);
% fprintf(' %f \n', grad(1:10));


% =============================================================

end