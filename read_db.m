function time = read_db( settings_vector )
%read_db Check if given settings have already been checked
%and return found time or 0 otherwise.
global conn;
template_select = ['SELECT TIME FROM SAMPLES WHERE '...
    'WING_F=%d AND WING_B=%d AND '...
    'STAB_F=%d AND STAB_B=%d AND '...
    'PRES_LF=%d and PRES_RF=%d AND ' ...
    'PRES_LB=%d AND PRES_RB=%d'];
query_select = sprintf(template_select, settings_vector);
cursor = exec(conn,query_select);
cursor = fetch(cursor);
time = cursor.data{1};
time = str2num(time);
close(cursor);
end

