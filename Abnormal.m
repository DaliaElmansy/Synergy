function Ab = Abnormal(Gx, mis, E)
if mean(E(Gx, mis)) > mean(E(Gx, :))
    Ab = mean(E(Gx, mis)) / mean(E(Gx, :));
else
    Ab = mean(E(Gx, :)) / mean(E(Gx, mis));
end
