clc;
clear;

f = @(x) x^2 - 2;
df = @(x) 2*x;

x = 1;
tol = 1e-6;
max_iter = 100;

for i = 1:max_iter
    x_new = x - f(x)/df(x);

    if abs(x_new - x) < tol
        break;
    end

    x = x_new;
end

fprintf('Root = %.8f\n', x_new);
fprintf('Iterations = %d\n', i);