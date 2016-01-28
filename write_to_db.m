function [ ] = write_to_db( time, settings_vector )
%write_to_db Adds new row to database, filled with given data
global conn;
template_insert = ['INSERT INTO TABLE_NAME VALUES (''%f'',%d,%d,%d,%d,'...
    '%d,%d,%d,%d'];
query_select = sprintf(template_insert, [time, settings_vector]);
cursor = exec(conn,query_select);
close(cursor)
end

