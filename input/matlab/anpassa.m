function [k, m, dk, dm] = anpassa(mapp, repetition)
         raa_data = load(strcat(int2str(mapp), '/', ...
             int2str(repetition), '.txt'));
         ft = fittype('poly1');
         fitobj = fit(raa_data(:, 1), raa_data(:, 2), ft);
         k = fitobj.p1;
         m = fitobj.p2;
         std_dev = diff(confint(fitobj, 0.6827))/2;
         dk = std_dev(1);
         dm = std_dev(2);
end
