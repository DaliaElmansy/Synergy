function M=mislabeled(g, D, c, E, threshold,workers)
M=[];
syn_initial = synergy(g, D, c, E);
samples = 1:length(c);

%local_c = containers.Map('KeyType','int32','ValueType','any');

syn_difference = 1;
count = 0;
%pool = parpool(32);
while syn_difference > threshold
    count = count + 1;
    max_difference = 0;
    max_index = -1;
    max_synergy = 0;
    syn_differences = zeros(length(samples), 1);
%    parfor i = 1:length(samples)
%     fprintf('sample_length: %i\n', length(samples));
     parfor (ind = 1:length(samples),workers)
        temp = struct();
        temp.local_c = c;
        temp.local_c(samples(ind)) = 1 - temp.local_c(samples(ind));
        % new_syn = synergy(g, D, local_c, E);
        % c(samples(i)) = 1 - c(samples(i));
        val = syn_differences(ind);
        % fprintf('i: %d\t syn_differences(i): %f\t difference: %f\theeey cmon\n', ind, val, new_syn - syn_initial);
        syn_differences(ind) = synergy(g, D, temp.local_c, E) - syn_initial;
    end

    max_difference = max(syn_differences);
    max_index = find(syn_differences == max_difference);
    if (length(max_index) > 1)
        max_index = max_index(1);
    end
    max_synergy = syn_differences(max_index) + syn_initial;
    if max_difference > threshold
        c(samples(max_index)) = 1 - c(samples(max_index));
        M = [M, samples(max_index)];
        samples(max_index) = [];
        syn_initial = max_synergy;
    else
        break;
    end
    syn_difference = max_difference;

end
%delete(pool)