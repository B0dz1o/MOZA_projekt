clc;
clear;
create_table;
global conn;
global allparams;
%x = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
%x: 
%   2 wings - [0:39]
%   2 stabilizers, front [0:115], back [0:75]
%   4 pressures - [0:105]
x0 = [5 5 60 35 75 70 85 80]; % based on user experience
A = [];
b = [];
Aeq = [];
beq = [];
lb = zeros(size(x0,1), size(x0,2));
ub = [39 39 115 75 105 105 105 105];
nonlcon = [];

options = psoptimset(@patternsearch);
options.TolMesh = 1;
options.MaxMeshSize = 8;
options.InitialMeshSize = 4;


x = patternsearch(@cost_fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
close(conn);
