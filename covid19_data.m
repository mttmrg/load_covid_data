clear all
clc

load('covid_table.mat');
old_covid_table=covid_table;

html=webread('https://www.worldometers.info/coronavirus');
tables = regexp(html,'<table.*?/table>','match');
today_table= tables(1);


countries_list={'World';'USA';'Greece';'UK';'Germany';'Italy';'Spain';...
                 'France';'Turkey';'India';'Brazil';'Russia';'China'};
           

for i=1:length(countries_list)
    if i==1
        [cases,deaths] =get_country_data(today_table,countries_list{i});
    else
        old_cases=cases;
        old_deaths=deaths;
        [cases,deaths] =get_country_data(today_table,countries_list{i});
        cases=char(old_cases,cases);
        deaths=char(old_deaths,deaths);
    end
end

cases=cellstr(cases);
deaths=cellstr(deaths);


covid_table=struct('date',datestr(now),'data',struct('countryname',countries_list...
                    ,'cases',cases,'deaths',deaths));

covid_table=[old_covid_table covid_table];

 save('covid_table.mat','covid_table')


cases=str2double(cases);
deaths=str2double(deaths);

a=length(covid_table);
b=length(countries_list);
for i=1:b+1
    if i==1
        fprintf('Date: %s\n',covid_table(a).date)
    else
        fprintf('%s Cases:%d Deaths:%d\n',countries_list{i-1},cases(i-1),deaths(i-1))
    end
end   
    