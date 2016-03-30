% Detta skript visar hur man passar en rät linje
%      y(x) = k*x + m
% till en dataserie med varianser (s2)

x = [1.3 2.7 3.5 7.8 9.2]';
y = [6.5 11.7 13.6 23.2 33.2]';
s2 = [1.3 0.9 0.6 13.4 2.2]';

% Vi kan plotta punkterna med osäkerheten utritad
% errorbar(x, y, s2.^0.5, 'o');

% Låt oss först göra en oviktad minsta-kvadrat-anpassning:
% A'A c = A'y
A = [ones(size(x)), x];
c_ols = A\y  % Matlab löser med hjälp av QR faktorisering
r_ols = A*c_ols - y;

% Formeln för WLS: (se Weighted least squares på e.g. wikipedia):
%     c_wls = inv(B)*A'*W*y
% där W & B ges av:
W = diag(1.0./s2);
B = A'*W*A;

% Vi löser med Cholesky faktorisering
% B är symmetrisk och positiv definit
C = chol(B);
c_wls = C\(C'\(A'*W*y))

r_wls = A*c_wls - y;

% Weighted Root Mean Square deviation
wrmsd_ols = sqrt(sum((r_ols./s2).^2))
wrmsd_wls = sqrt(sum((r_wls./s2).^2))  % skall vara lägre än *_ols
