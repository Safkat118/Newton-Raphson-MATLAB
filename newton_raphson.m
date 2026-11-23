
clc;
clear;
close all;

%% 1. Define the function
f = @(x) x^2 - 2;
df = @(x) 2*x;

%% 2. Initial parameters
x = 1;
tol = 1e-6;
max_iter = 100;

%% 3. Initialize iteration data
iteration = [];
x_old = [];
fx_old = [];
x_new = [];
abs_error = [];
rel_error = [];

%% 4. Newton-Raphson Iteration
for i = 1:max_iter

    if abs(df(x)) < eps
        error('Derivative is too close to zero.');
    end

    fx = f(x);
    x_next = x - fx/df(x);

    % Calculate errors
    error_abs = abs(x_next - x);
    error_rel = error_abs / max(abs(x_next), eps) * 100;

    % Store iteration data
    iteration(end+1,1) = i;
    x_old(end+1,1) = x;
    fx_old(end+1,1) = fx;
    x_new(end+1,1) = x_next;
    abs_error(end+1,1) = error_abs;
    rel_error(end+1,1) = error_rel;

    % Update approximation
    x = x_next;

    % Check convergence
    if error_abs < tol
        break;
    end
end

%% 5. Display Iteration Table
Results = table(iteration, x_old, fx_old, ...
    x_new, abs_error, rel_error);

disp('Newton-Raphson Iteration Results:');
disp(Results);

%% 6. Display Final Result
fprintf('\nFinal Root = %.10f\n', x);
fprintf('Total Iterations = %d\n', i);
fprintf('Final Absolute Error = %.10e\n', abs_error(end));

%% 7. Plot Convergence Graph
figure;

semilogy(iteration, abs_error, '-o', ...
    'LineWidth', 1.5, 'MarkerSize', 7);

grid on;

xlabel('Iteration Number');
ylabel('Absolute Error (Log Scale)');
title('Newton-Raphson Convergence');
