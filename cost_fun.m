function circuit_time = cost_fun( settings_vector )
%cost_fun - runs single circuit with given settings
%settings_vector = [pressures stabilizers wings]
%pressure - vector [ left_front, right_front, left_back, rear right]
%stabilizers - vector of 2 elements [front; rear]
%wings - vector of 2 elements [front; rear]
%circuit time - double precision value, given in seconds
time = read_db(settings_vector);
disp(settings_vector)
if time ~= 0
    circuit_time = time;
    return;
else
    time = run_sim(settings_vector);
    write_to_db(time, settings_vector);
end
close(cursor)
end
