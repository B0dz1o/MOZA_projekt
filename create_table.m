global conn;
javaaddpath('D:\uzyt\workspace\MOZA\sqlite-jdbc-3.8.11.2.jar');
url = 'jdbc:sqlite:D:\uzyt\workspace\MOZA\samples.db';
conn = database('D:\uzyt\workspace\MOZA\samples.db','','','org.sqlite.JDBC',url);
create_query = ['CREATE TABLE IF NOT EXISTS SAMPLES (TIME TEXT, '...
    'WING_F INT, WING_B INT, STAB_F INT, STAB_B INT, ' ...
	'PRES_LF INT, PRES_RF INT, PRES_LB INT, PRES_RB INT,'...
    'TIMESTAMP DEFAULT CURRENT_TIMESTAMP)'];
cursor = exec(conn, create_query);
close(cursor);
