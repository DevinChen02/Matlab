function amount = lottery(ticket)
% LOTTERY checks whether a lottery ticket has winning numbers. The
% function returns the winning dolar amount based on the following formula:
%       No match: amount = 0
%       1 matching number:  amount = 10
%       2 matching numbers: amount = 100
%       3 matching numbers: amount = 1,000
%       4 matching numbers: amount = 10,000
%       5 matching numbers: amount = 1,000,000
%       6 matching numbers: amount = 100,000,000
% Call format: amount = lottery(ticket)

load('winning_number.dat');
amount = 0;
match = intersect(ticket,winning_number);
if numel(match) == 1
    amount = 10;
end
if numel(match) == 2
   amount = 100;
end
if numel(match) == 3
   amount = 1000;
end
if numel(match) == 4 
   amount = 10000;
end
if numel(match) == 5
   amount = 1000000;
end
if numel(match) == 6
   amount = 100000000;
end

end % function lottery