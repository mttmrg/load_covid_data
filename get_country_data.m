function [cases,deaths]=get_country_data(table,country)    

if country=="World"
   sub_table=extractBetween(table,[country '</td>'],'data-continent="all">All</td>');
   elseif country=="China"
       sub_table=extractBetween(table,'China</a></td>','display');
   else
       sub_table=extractBetween(table,[country '</a></td>'],'world-population');
   end
   
   new_table=sub_table{1};
   b=zeros(1,3);
   c=zeros(1,12);
 
   if country=="World"                             %if country=World
       
       b=strfind(new_table,'<td>');
       c=strfind(new_table,'</td>');
       cases= new_table(b(1)+4:c(1)-1);
       deaths= new_table(b(3)+4:c(3)-1);
       e=strsplit(cases,',');
       if ~isscalar(e)
           cases=[e{1} e{2} e{3}];
       end
       
       e=strsplit(deaths,',');
       if ~isscalar(e)
           deaths=[e{1} e{2} e{3}];
       end
       
   else                                            %if country~=World
       
       b=strfind(new_table,'text-align:right">');
       c=strfind(new_table,'</td>');
       d=strfind(new_table,'text-align:right;">');
       f=strfind(new_table,'FFEEAA');
      
       if isempty(f)                                 
   %cases---------------------------------
               cases= new_table(b(1)+18:c(1)-1);
               e=strsplit(cases,',');                
               if ~isscalar(e)
                   if length(e)==2
                       cases=[e{1} e{2}];
                   else
                       cases=[e{1} e{2} e{3}];
                   end
               end
   %deaths-------------------------------
               deaths= new_table(d(2)+19:c(3)-2);
               e=strsplit(deaths,',');                
               if ~isscalar(e)
                   if length(e)==2
                       deaths=[e{1} e{2}];
                   else
                       deaths=[e{1} e{2} e{3}];
                   end
               end
               
       else                                           

   %cases--------------------------------
           cases= new_table(b(1)+18:c(1)-1);
           e=strsplit(cases,',');               
           if ~isscalar(e)
               if length(e)==2
                   cases=[e{1} e{2}];
               else
                   cases=[e{1} e{2} e{3}];
               end
           end
   %deaths-------------------------------
           deaths= new_table(d(1)+19:c(3)-2);
           e=strsplit(deaths,',');                
           if ~isscalar(e)
               if length(e)==2
                   deaths=[e{1} e{2}];
               else
                   deaths=[e{1} e{2} e{3}];
               end               
           end
           
       end 
   end
end