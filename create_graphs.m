function create_graphs(table, country)


country=string(country);

countries_list={'World';'USA';'Greece';'UK';'Germany';'Italy';'Spain';...
                 'France';'Turkey';'India';'Brazil';'Russia';'China'};
             
for i=1:length(countries_list) 
    if country==countries_list{i}
        j=i;
    end
end

for i=1:length(table)
    if i==1
        gcases={table(i).data.cases};
        gcases=str2double(gcases{j});
    else
        old_gcases=gcases;
        gcases={table(i).data.cases};
        gcases=str2double(gcases{j});
        gcases=[old_gcases;gcases];
    end
end

for i=1:length(table)
    if i==1
        gdeaths={table(i).data.deaths};
        gdeaths=str2double(gdeaths{j});
    else
        old_gdeaths=gdeaths;
        gdeaths={table(i).data.deaths};
        gdeaths=str2double(gdeaths{j});
        gdeaths=[old_gdeaths;gdeaths];
    end
end

for i=1:length(table)
    if i==1
        gdate=table(i).date;
        gdate=extractBefore(gdate,7);        
        gdate={gdate};
    else
        old_gdate=gdate;
        gdate=table(i).date;
        gdate=extractBefore(gdate,7);        
        gdate={gdate};
        gdate=[old_gdate;gdate];
    end
end

subplot(1,2,1)
x=1:length(table);
y=gcases;
plot(x,y,'rx:','markersize',10)
xlabel('DATE','Color','r')
ylabel('CASES','Color','r')
title(['CASES-' char(country)],'Color','r')
set( gca, 'XTickLabel',gdate)



subplot(1,2,2)
x=1:length(table);
y=gdeaths;
plot(x,y,'bx:','markersize',10)
xlabel('DATE','Color','b')
ylabel('DEATHS','Color','b')
title(['DEATHS-' char(country)],'Color','b')
set( gca, 'XTickLabel',gdate)



end