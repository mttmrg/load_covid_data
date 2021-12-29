function create_stats(table,country)


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

h=length(table);
for i=h+1:-1:2
    if i==h+1
        fprintf('CASES\n')
    else
        x1=gcases(i);                        
        x2=gcases(i-1);                      
        if x1==x2
        
        else 
            x=x1-x2;                         
            p=(x/x2)*100;                    
            
            p=num2str(p);                    
            e=strsplit(p,'.');
            if ~isscalar(e)
                e{2}=pad(e{2},6,'right','0');
                dek=extractBefore(e{2},2);
                xil=extractAfter(e{2},2);
                ek=extractBetween(e{2},dek,xil);
                ek=str2num(ek{1});
                if ek==5 | ek>5
                    dek=str2num(dek)+1;
                    dek=num2str(dek);
                end
                p=[e{1} '.' dek];
            end
            p=str2num(p);
            fprintf('%10d  %10d  %8d  %2.1f%%\n',x1,x2,x,p)
        end
    end
end


h=length(table);
met=0;
for i=h+1:-1:2
    if i==h+1
        fprintf('\n')
        fprintf('DEATHS\n')
    else
        x1=gdeaths(i);                     
        x2=gdeaths(i-1);               
        if x1==x2
        met=met+1;
        else 
            x=x1-x2;                         
            p=(x/x2)*100;                   
            
            p=num2str(p);                    
            e=strsplit(p,'.');
            if ~isscalar(e)
                e{2}=pad(e{2},6,'right','0');
                dek=extractBefore(e{2},2);
                xil=extractAfter(e{2},2);
                ek=extractBetween(e{2},dek,xil);
                ek=str2num(ek{1});
                if ek==5 | ek>5
                    dek=str2num(dek)+1;
                    dek=num2str(dek);
                end
                p=[e{1} '.' dek];
            end
            p=str2num(p);        
            fprintf('%10d  %10d  %8d  %2.1f%%\n',x1,x2,x,p)
        end
    end
end

% 
if met==h-1
    x1=gdeaths(h);
    x2=gdeaths(h-1);
    fprintf('%10d  %10d  0  0%%\n',x1,x2)
end


h=length(table);
for i=h+1:-1:1
    if i==h+1
        fprintf('\n')
        fprintf('CASES/DEATHS\n')
    else
        x1=gcases(i);        
        x2=gdeaths(i);
        x3=0;
        if i<h
            x3=gcases(i+1);
        end
        if x1==x3
        
        else 
            p=(x2/x1)*100;
            
            p=num2str(p);                     
            e=strsplit(p,'.');
            if ~isscalar(e)
                e{2}=pad(e{2},6,'right','0');
                dek=extractBefore(e{2},2);
                xil=extractAfter(e{2},2);
                ek=extractBetween(e{2},dek,xil);
                ek=str2num(ek{1});
                if ek==5 | ek>5
                    dek=str2num(dek)+1;
                    dek=num2str(dek);
                end
                p=[e{1} '.' dek];
            end
            p=str2num(p);    
            fprintf('%10d  %8d  %2.1f%%\n',x1,x2,p)
        end
    end
end


end