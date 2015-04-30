% Antag att vi har en ickelinjär funcktion f(x) med två
% parametrar a och b:
%
%               x^b + 1
% f(x) =  a * -----------
%             x^(b+1) + 1
%
% Funktionen f(x) är enkel och kan beskrivas i matlab som:
%
%    f = @(a, b, x) (a*(x.^b + 1)./(x.^(b+1) + 1));
%
% men låt oss låtsas att den är lång och att vi vill uttrycka
% den i termer av en hjälpfunktion g(p, x) (detta är något ni
% kan vilja använda er av):
g = @(p, x) (x.^p + 1);
f = @(a, b, x) (a*g(b, x)./g(b+1, x));

% Antag att f(t) är en observabel med mätosäkerhet
% vi kan simulera detta med normalfördelat brus:
N = 1000; t = linspace(0, 4, N);
alpha = 2.0; beta = 3.0;
rng('default'); % ger reproducerbara stokastiska värden
y = f(alpha, beta, t) + random('Normal', 0, 0.1, 1, N);

% Ni kommer istället att läsa in t och y från en textfil.
% Det gör ni med funktionen ``load``, exempel:
%
%    raadata = load("XdegC_Ymolal_3.txt")

% Låt oss plotta mätdata:
plot(t, y);

% Låt oss nu se ifall vi kan genom kurvanpassning
% bestämma alpha och beta från våra brusiga data i y.
% Syntax för fit(...) hittar vi i dokumentationen:
% http://se.mathworks.com/help/curvefit/fit.html
% Där står det att vi behöver anropa fittype på vår funktion
% först för att sedan använda det objektet i anrop på fit:
ftyp = fittype(f);

% fit vill ha kolumnvektorer så vi transponerar t och y
% OBS: den sista vektorn är startgissning för alpha och beta
% Ifall passningen inte fungerar kan ni prova med 
% olika startgissningar.
[fitobj, gof, nfo] = fit(t', y', ftyp, 'StartPoint', [1, 1]);
fitobj

% Standard avvikelsen för resp. parameter fås genom:
standard_deviation = diff(confint(fitobj, 0.6827))/2

% Root-mean-square-error (användbar för kvalitetsjämförelse)
root_mean_square_error = gof.rmse

% vi kan rita in passningen över våra brusiga data för att
% få en visualisering av "goodness of fit"
hold on;
handle = plot(t, f(fitobj.a, fitobj.b, t));
legend('Data', 'Passning');
saveas(handle, 'passning.png', 'png'); % sparar vår plot
