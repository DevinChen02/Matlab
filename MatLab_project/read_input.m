function [m, k, l, Xo, Yo, Zo, Uo, Vo, Wo] = read_input(input_filename, exp_num)
% READ_INPUT takes filename and experiment number as inputs to output
% the corresponding parameters used to simulate bungee trajectories
% Call format: [m, k, l, Xo, Yo, Zo, Uo, Vo, Wo] = read_input(input_filename, exp_num)

param = importdata(input_filename,',',4);

if any(param.data(:,1) == exp_num)
    row_id = param.data(:,1) == exp_num;
    m = param.data(row_id,2);
    k = param.data(row_id,3);
    l = param.data(row_id,4);
    Xo = param.data(row_id,5);
    Yo = param.data(row_id,6);
    Zo = param.data(row_id,7);
    Uo = param.data(row_id,8);
    Vo = param.data(row_id,9);
    Wo = param.data(row_id,10);
else
    m = NaN;
    k = NaN;
    l = NaN;
    Xo = NaN;
    Yo = NaN;
    Zo = NaN;
    Uo = NaN;
    Vo = NaN;
    Wo = NaN;
    disp('Experiment number is not in the file');
end

end % end read_input