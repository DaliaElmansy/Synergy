function R = Random(Gx, mis, E)
R = std(E(Gx, mis)) / std(E(Gx, :));
