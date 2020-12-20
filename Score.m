function S = Score(Gx, mis, E)
MinMis = 5;
MaxMis = 19;
MaxRandom = 0.2;
MinAbnormal = 1.1;

if length(mis) > MinMis && length(mis) < MaxMis && Random(Gx, mis, E) < MaxRandom && Abnormal(Gx, mis,E) > MinAbnormal
    S = (mean(E(Gx, mis)) / mean(E(Gx, :))) / std(E(Gx, mis)) / std(E(Gx, :));
else
    S = 0;
end