clear all; close all; clc; format long; 
name = 'AAAA AAAA';
id = 'A00000000';
hw_num = 8;

%% Problem 1: (a-d) 6 pts each, (e) 8 pts, total 32 pts
load('note.mat')
sp1a = size(note);
sp1b = note(:,1);
sp1c = note(end,:);
sp1d = note{3,2};
sp1e = sp1b;
for n = 1:length(sp1e)
    sp1e{n}(1) = upper(sp1e{n}(1));
    for m = 1:length(sp1e{n})
        if sp1e{n}(m)== ' '
            sp1e{n}(m+1) = upper(sp1e{n}(m+1));
        end
    end
end

%% Problem 2: (a-c) 6 pts each, (d) 10 pts, total 28 pts
student(3) = struct('name','Oliver Harper','PID','A03','homework',[80 71 92 73 64 75 96 77],...
    'project',77,'midterm',91,'final_exam',76);
student(2) = struct('name','Benjamin Frank','PID','A02','homework',[90 81 92 83 67 85 86 92],...
    'project',82,'midterm',83,'final_exam',91);
student(1) = struct('name','Noah Williams','PID','A01','homework',[70 91 82 93 84 85 96 78],...
    'project',96,'midterm',93,'final_exam',63);
            
sp2a = student(1);
sp2b = student(2);
sp2c = student(3);
for n = 1:length(student)
    student(n).hw_average = (sum(student(n).homework) - min(student(n).homework))/7;
end
sp2d = [student.hw_average];

%% Problem 3: (a) 16 pts, (b-d) 8 pts each, total 40 pts
fid = fopen('class_survey.dat','r');
n = 1;
while ~feof(fid)
    aline = fgetl(fid);
    [survey(n).Q1, rest] = strtok(aline);    
    [survey(n).Q2, rest] = strtok(rest);
    [survey(n).Q3, rest] = strtok(rest);
    [survey(n).Q4, rest] = strtok(rest);
    rest = fliplr(rest);
    [Q6, Q5] = strtok(rest);
    survey(n).Q5 = strtrim(fliplr(Q5));
    survey(n).Q6 = fliplr(Q6);
    n = n+1;
end
fclose(fid);

% Part a:
lab_session = {'Tue', 'Wed', 'Thu','Fri'};
for n = 1:length(lab_session)
    number_students(n) = numel(strfind([survey.Q3],lab_session{n}));
end
figure(1);
bar(number_students); ylim([0 80]);
ylabel('number of students'); 
title('Which lab session do you attend most frequently?');
set(gca,'XtickLabel',lab_session,'FontSize',16);
sp3a = 'See figure 1';

% Part b:
sp3b = numel(strfind([survey.Q2],'Yes'));

% Part c:
sp3c = numel(strfind([survey.Q5],'7 - 9')) ...
    + numel(strfind([survey.Q5],'>= 10'));

% Part d:
sp3d = 0;
for n = 1:length(survey)
    if strcmp(survey(n).Q1,'Sophomore') && ...
       strcmp(survey(n).Q4,'A') 
        sp3d = sp3d + 1;
    end
end
