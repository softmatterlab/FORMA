function indexRd= BB_index_filter_x_Rd_v2(Rd, xT, yT, x0, y0)

%translates to the point to be considered
xtras=xT-x0;
ytras=yT-y0;
%filter the data that is in side a circle of radius Rd
indexRd=find(sqrt(xtras.^2+ytras.^2)<=Rd);
end