function [ time ] = run_sim( settings_vector )
%run_sim Prepares settings file and runs a single simulation.
settings_id = fopen('settings_template.svm');
template_text = textscan(settings_id, '%s','delimiter','\n');
fclose(settings_id);
template_text = template_text{1};
template_text{29} = sprintf('FWSetting=%d//40', settings_vector(1));
template_text{32} = sprintf('RWSetting=%d//1', settings_vector(2));
template_text{39} = sprintf('FrontAntiSwaySetting=%d//195 N/mm', settings_vector(3));
template_text{40} = sprintf('RearAntiSwaySetting=%d//95 N/mm', settings_vector(4));
template_text{89} = sprintf('PressureSetting=%d//195 kPa', settings_vector(5));
template_text{103} = sprintf('PressureSetting=%d//195 kPa', settings_vector(6));
template_text{117} = sprintf('PressureSetting=%d//195 kPa', settings_vector(7));
template_text{131} = sprintf('PressureSetting=%d//195 kPa', settings_vector(8));

sim_settings_file = fopen('D:\Program Files (x86)\rFactor\UserData\Piotr\Settings\Brianza_Italiangp\moza.svm','w');
for i = 1: size(template_text,1)
    fprintf(sim_settings_file,'%s\n', template_text{i});
end
fclose(sim_settings_file);
system('runsim.au3');

list = dir('D:\Program Files (x86)\rFactor\UserData\LOG\Results\*.xml');
result_file = ['D:\Program Files (x86)\rFactor\UserData\LOG\Results\', list.name];
DOMnode = xmlread(result_file);
lap = DOMnode.getElementsByTagName('Lap').item(1);
time_str = char(lap.item(0));
time = sscanf(time_str, '[#text: %f]');
if size(time,1) ~= 1 || size(time,2)
    throw(MException('xml','Time not found'));
end
delete(result_file);
end

