function [  ] = write_to_db( time, settings_vector )
%write_to_db Adds new row to database, filled with given data
global conn;
template_insert = ['INSERT INTO SAMPLES VALUES (''%f'',%d,%d,%d,%d,'...
    '%d,%d,%d,%d,''%s'')'];
timestamp = datestr(now, 'yyyy-mm-dd HH:MM:SS');
query_insert = sprintf(template_insert, time, settings_vector, timestamp);
cursor = exec(conn,query_insert);
close(cursor)
end

