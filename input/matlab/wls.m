% Detta skript visar hur man passar en rät linje
%      y(x) = k*x + m
% till en dataserie där vi har ett mått på osäkerheten i varje punkt (dy):

x = [1.3 2.7 3.5 7.8 9.2];
y = [6.5 11.7 13.6 25.2 33.2];
dy = [1.3 0.9 0.6 2.4 2.2];

% Vi kan plotta punkterna med osäkerheten utritad
errorbar(x, y, dy, 'o')

% Nu genomför vi en s.k. "viktad" minsta kvadrat anpassning:
% http://se.mathworks.com/help/curvefit/fit.html
f = fittype('poly1');  % Linjär ekvation (2 parametrar)
options = fitoptions('poly1');
options.Weights = 1./dy;
fitobj = fit(x', y', f, options);
k = fitobj.p1
m = fitobj.p2
% Standard avvikelsen för resp. parameter fås genom:
std_dev = diff(confint(fitobj, 0.6827))/2;
dk = std_dev(1)
dm = std_dev(2)

hold on;
handle = plot([x(1) x(end)], m + k*[x(1) x(end)]);
lbl = sprintf('fit: y = (%.2f +/- %.2f) x + %.2f +/- %.2f', k, dk, m, dm);
legend('data', lbl, 'Location', 'NorthWest')
saveas(handle, 'wls_fit.png', 'png')