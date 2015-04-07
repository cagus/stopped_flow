% Antag att vi har en ickelinjär funcktion f(x) med två
% parametrar a och b:
%
%               x^b + 1
% f(x) =  a * -----------
%             x^(b+1) + 1
%
f = @(a, b, x) (a*(x.^b + 1)./(x.^(b+1) + 1));

% Antag att f(t) är en observabel med mätosäkerhet
% vi kan simulera detta med normalfördelat brus:
N = 1000;
t = linspace(0, 4, N);
alpha = 2.0;
beta = 3.0;

y = f(alpha, beta, t) + random('Normal', 0, 0.1, 1, N);
plot(t, y);


% Låt oss nu se ifall vi kan genom kurvanpassning
% bestämma alpha och beta från våra brusiga data i y.
%
% Syntax för fit(...) hittar vi i dokumentationen:
% http://se.mathworks.com/help/curvefit/fit.html

ftyp = fittype(f);

% fit vill ha kolumnvektorer så vi transponerar t och y
fitobj = fit(t', y', ftyp, 'StartPoint', [1,1])

% vi kan rita in passningen över våra brusiga data för att
% få en visualisering av "goodness of fit"
hold on;
handle = plot(t, f(fitobj.a, fitobj.b, t));
legend('Data', 'Passning');
saveas(handle, 'passning.png', 'png');
