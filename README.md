# Visualization on the spread of the COVID-19 virus
Loading, processing and plotting the data from https://www.worldometers.info/coronavirus on Matlab. The information are collected automatically from the online repository, so an internet connection is needed in order to run the script.

The script creates and updates a covid_table array of structures which contains an entry for each time the script is run and consists of two fields: date and data.
When the code is run the number of cases and deaths are gathered for the following countries: 
- World 
- USA
- UK 
- Germany
- Italy
- Spain
- France
- Turkey
- Greece
- India 
- Brazil
- Russia
- China

The script contains also the following functions:
- create_graphs (covid_table, 'country')
- create_stats (covid_table, 'country')

The create_graphs function generates two graphs, one for the number of cases and one for the number of deaths for the reporting country with all the data from the covid_table array.
The create_stats function shows the percentage increase.

# Automatization
You can use information found here:
https://www.mathworks.com/matlabcentral/answers/99750-how-do-i-execute-a-matlab-script-at-a-specific-time-each-day
to automatically run the script once a day.
