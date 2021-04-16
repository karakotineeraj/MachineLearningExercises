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

H = sigmoid(X * theta);

J = (-1/m) * (y' * log(H) + (1-y)' * log(1-H));
J = J + (lambda/(2*m)) * ( sum(theta .* theta) - theta(1)*theta(1) );

n = size(X, 2);
for i = 1:n
  for j = 1:m
    grad(i,1) = grad(i,1) + (H(j,1) - y(j,1)) * X(j, i);
  endfor
  
  if i != 1
      grad(i,1) = grad(i,1) + lambda*(theta(i,1));
  endif
endfor

grad = grad/m;

% =============================================================

end
