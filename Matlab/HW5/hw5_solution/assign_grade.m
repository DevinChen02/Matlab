function [total_score, letter] = assign_grade(homework, midterm, project, final)
% ASSSIGN_GRADE computes total score and assign a letter grade
% based on the homework, midterm, project and final exam scores. 
% Call format: [total_score, letter] = assign_grade(homework, midterm, project, final)

%% Compute total score
total_score = 0.25*(sum(homework)-min(homework))/7 + 0.2*project ...
                   + max(0.25*midterm+0.3*final, 0.55*final);

%% Assign letter grade 
if total_score >= 97
    letter = 'A+';
elseif total_score >= 93
    letter = 'A';
elseif total_score >= 90
    letter = 'A-';
elseif total_score >= 87
    letter = 'B+';
elseif total_score >= 83
    letter = 'B';
elseif total_score >= 80
    letter = 'B-';
elseif total_score >= 77
    letter = 'C+';
elseif total_score >= 73
    letter = 'C';
elseif total_score >= 70
    letter = 'C-';
elseif total_score >= 60
    letter = 'D';
elseif total_score < 60
    letter = 'F';
else
    letter = NaN;
end
    
end % function assign_grade

