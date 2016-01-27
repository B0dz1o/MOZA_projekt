global conn;
%javaaddpath('D:\uzyt\workspace\MOZA\sqlite-jdbc-3.8.11.2.jar');
url = 'jdbc:sqlite:D:\uzyt\workspace\MOZA\samples.db';
conn = database('D:\uzyt\workspace\MOZA\samples.db','','','org.sqlite.JDBC',url);
create_table = ['CREATE IF NOT EXISTS TABLE SAMPLES (TIME TEXT, '...
   'PRES_LF INT, PRES_RF INT, PRES_LB INT, ' ...
   'PRES_RB INT, STAB_F INT, STAB_B INT, WING_F INT, WING_B INT)'];
cursor = exec(conn, create_table);
%x = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
%x: 4 pressures - [0:105]
%   2 stabilizers, front [0:115], back [0:75]
%   2 wings - [0:39]
x0 = [75 70 85 80 60 35 5 5]; % based on user experience
A = [];
b = [];
Aeq = [];
beq = [];
lb = zeros(size(x0,1), size(x0,2));
ub = [105 105 105 105 115 75 39 39];
nonlcon = [];


x = patternsearch(@cost_fun,x0,A,b,Aeq,beq,lb,ub,nonlcon);
close(conn);
