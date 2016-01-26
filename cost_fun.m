function circuit_time = cost_fun( settings_vector )
%cost_fun - runs single circuit with given settings
%settings_vector = [pressures stabilizers wings]
%pressure - vector [ left_front, right_front, left_back, rear right]
%stabilizers - vector of 2 elements [front; rear]
%wings - vector of 2 elements [front; rear]
%circuit time - double precision value, given in seconds
global conn;
template_select = ['SELECT TIME FROM SAMPLES WHERE PRES_LF=%d and PRES_RF=%d' ...
    'AND PRES_LB=%D AND PRES_RB=%d AND'...
    'STAB_F=%d AND STAB_B=%d AND'...
    'WING_F=%d AND WING_B=%D'];
query_select = sprintf(template_select, settings_vector);
cursor = exec(conn,query_select);
end

