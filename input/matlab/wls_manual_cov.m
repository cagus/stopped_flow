% Nu skattar vi kovariansmatrisen för våra parametrar
sigmah2_ols =  (r_ols'*r_ols)./(size(y)(1) - 2);
cov_ols = sigmah2_ols * inv(A'*A);
delta_c_ols = sqrt(diag(cov_ols))

sigmah2_wls =  (r_wls'*(r_wls./s2))./(size(y)(1) - 2)
cov_wls = sigmah2_wls * inv(B)
delta_c_wls = sqrt(diag(cov_wls))
