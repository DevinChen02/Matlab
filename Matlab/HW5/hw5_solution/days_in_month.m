function [days] = days_in_month(month,leap)
% DAYS_IN_MONTH outputs the number of days in the input month. Input month 
% shoud be an all-lower-case string denoting the first three letters of the 
% month. Input leap should have a logical value (0 or 1) to account for leap year.
% Call format: day = days_in_month(month)

switch month
    case {'apr','jun','sep','nov'}
        days = 30;
    case 'feb'
        switch leap
            case 1
                days = 29;
            case 0
                days = 28;
            otherwise
                days = 'Invalid inputs';
        end
    case {'jan','mar','may','jul','aug','oct','dec'}
        days = 31;
    otherwise
        days = 'Invalid inputs';
end
end % function days_in_month