function threeway = threeway_synergy(g1_n, g2_n, g3_n, D, c, E, gene_names)

g1 = find(ismember(gene_names, g1_n));
g2 = find(ismember(gene_names, g2_n));
g3 = find(ismember(gene_names, g3_n));

threeway_mi = 1 - entropy([g1, g2, g3], D, c, E);
mi_g1 = 1 - entropy(g1, D, c, E);
mi_g2 = 1 - entropy(g2, D, c, E);
mi_g3 = 1 - entropy(g3, D, c, E);

mi_g12 = 1 - entropy([g1, g2], D, c, E);
mi_g23 = 1 - entropy([g2, g3], D, c, E);
mi_g13 = 1 - entropy([g1, g3], D, c, E);

arg1 = mi_g1 + mi_g23;
arg2 = mi_g2 + mi_g13;
arg3 = mi_g3 + mi_g12;
arg4 = mi_g1 + mi_g2 + mi_g3;
    
threeway = threeway_mi - max([arg1, arg2, arg3, arg4]);