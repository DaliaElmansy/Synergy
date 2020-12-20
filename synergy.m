function S = synergy(g, D, c, E)
% Computes the normalized synergy of two genes with respect to  
% phenotype.
%   g - the gene indices, must be a 1x2 matrix.
%   D - the cutoff distance.
%   c - the phenotype indicator, a Nx1 matrix. 1 - Case, 0 - Control.
%   E - the expression data itself, a MxN matrix, M is the number of enes.
n = length(g);
if (n ~= 2)
    error('Must supply a 1x2 matrix of genes.');
else
    g1 = g(1);
    g2 = g(2);
    % Compute H(C|G1) normalized by H(C)
    H1 = entropy(g1, D, c, E);
    % Compute H(C|G2) normalized by H(C)
    H2 = entropy(g2, D, c, E);
    % Compute H(C|G1,G2) normalized by H(C)
    H12 = entropy(g, D, c, E);
    % Now compute normalized synergy (all terms are normalized by H(C))
    % Synergy = H(C|G1) + H(C|G2) - H(C|G1,G2) - H(C)
    S = (H1 + H2 - H12 - 1);
end