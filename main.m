conn = database('D:\uzyt\workspace\MOZA\samples.db','','','org.sqlite.JDBC','URL');
conn.message
cursor = exec(conn,'CREATE IF NOT EXISTS TABLE SAMPLES (PRES_LF INT, PRES_RF INT, PRES_LB INT, PRES_RB INT, STAB_F INT, STAB_B INT, WING_F INT, WING_B INT)')