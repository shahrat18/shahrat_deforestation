# shahrat_deforestation

Report for ForestQuery into Global Deforestation, 1990 to 2016 
ForestQuery is on a mission to combat deforestation around the world and to raise awareness about this topic and its impact on the environment. The data analysis team at ForestQuery has obtained data from the World Bank that includes forest area and total land area by country and year from 1990 to 2016, as well as a table of countries and the regions to which they belong.

The data analysis team has used SQL to bring these tables together and to query them in an effort to find areas of concern as well as areas that present an opportunity to learn from successes.

1. GLOBAL SITUATION
According to the World Bank, the total forest area of the world was ___41282694.9_______________ in 1990. As of 2016, the most recent year for which data was available, that number had fallen to _39958245.9_________________, a loss of ___1324449_______________, or ____32.08______________%.

The forest area lost over this time period is slightly more than the entire land area of ___Bangladesh_______________ listed for the year 2016 (which is _130170.0071 sqkm_________________).

2. REGIONAL OUTLOOK
In 2016, the percent of the total land area of the world designated as forest was _____32.42%_____________. The region with the highest relative forestation was_Latin America & Carribbean_________________, with ____46.16______________%, and the region with the lowest relative forestation was Middle East & North Africa__________________, with ______2.07____________% forestation.

In 1990, the percent of the total land area of the world designated as forest was _______31.38___________. The region with the highest relative forestation was_ Latin America & Carribbean _________________, with _____51.03_____________%, and the region with the lowest relative forestation was _Middle East & North Africa_________________, with __1.78________________% forestation.







Table 2.1: Percent Forest Area by Region, 1990 & 2016:

Region	1990 Forest Percentage	2016 Forest Percentage
Latin America & Carribbean	51.03	46.16
Sub-Saharan Africa	30.67	28.79
World	32.42	31.38


The only regions of the world that decreased in percent forest area from 1990 to 2016 were _ Latin America & Carribbean _________________ (dropped from __51.03________________% to _____46.16_____________%) and _ Sub-Saharan Africa _________________ (_____30.67_____________% to ___28.79_______________%). All other regions actually increased in forest area over this time period. However, the drop in forest area in the two aforementioned regions was so large, the percent forest area of the world decreased over this time period from _____32.42_____________% to ______31.38____________%. 

3. COUNTRY-LEVEL DETAIL
A.	SUCCESS STORIES
There is one particularly bright spot in the data at the country level, __Brazil________________. This country actually increased in forest area from 1990 to 2016 by __541510 sqkm________________. It would be interesting to study what has changed in this country over this time to drive this figure in the data higher. The country with the next largest increase in forest area from 1990 to 2016 was the_Indonesia_________________, but it only saw an increase of __282193.98 sqkm________________, much lower than the figure for ___Brazil_______________.

_Myanmar_________________ and Nigeria__________________ are of course very large countries in total land area, so when we look at the largest percent change in forest area from 1990 to 2016, we aren’t surprised to find a much smaller country listed at the top. ____Tanzania______________ increased in forest area by ___as_______________% from 1990 to 2016. 

B.	LARGEST CONCERNS
Which countries are seeing deforestation to the largest degree? We can answer this question in two ways. First, we can look at the absolute square kilometer decrease in forest area from 1990 to 2016. The following 3 countries had the largest decrease in forest area over the time period under consideration:

Table 3.1: Top 5 Amount Decrease in Forest Area by Country, 1990 & 2016:

Country	Region	Absolute Forest Area Change
Togo	Sub-Saharan Africa	5168 sqkm
Nigeria	Sub-Saharan Africa	106506 sqkm
Uganda	Sub-Saharan Africa	28092 sqkm


The second way to consider which countries are of concern is to analyze the data by percent decrease.

Table 3.2: Top 5 Percent Decrease in Forest Area by Country, 1990 & 2016:

Country	Region	Pct Forest Area Change
Togo	Sub-Saharan Africa	75.45%
Nigeria	Sub-Saharan Africa	61.80%
Uganda	Sub-Saharan Africa	59.13%


When we consider countries that decreased in forest area percentage the most between 1990 and 2016, we find that four of the top 5 countries on the list are in the region of _Sub-Saharan Africa
_________________. The countries are _Togo_________________, _Nigeria_________________, _Uganda_________________, and __mauritania________________. The 5th country on the list is _Honduras_________________, which is in the _Latin America & Carribean_________________ region. 

From the above analysis, we see that _Nigeria_________________ is the only country that ranks in the top 5 both in terms of absolute square kilometer decrease in forest as well as percent decrease in forest area from 1990 to 2016. Therefore, this country has a significant opportunity ahead to stop the decline and hopefully spearhead remedial efforts.

C.	QUARTILES




Table 3.3: Count of Countries Grouped by Forestation Percent Quartiles, 2016:

Quartile	Number of Countries
1	85
2	72
3	38
4	9

The largest number of countries in 2016 were found in the ____1st______________ quartile.

There were ______85____________ countries in the top quartile in 2016. These are countries with a very high percentage of their land area designated as forest. The following is a list of countries and their respective forest land, denoted as a percentage.

Table 3.4: Top Quartile Countries, 2016:
 
Country	Region	Pct Designated as Forest
Amecia Samoa	East Asia & Pacific	87.50
Gabon	Sub-Saharan Africa	90.04
Guyana	Latin America & Carribean	83.90

4. RECOMMENDATIONS
Write out a set of recommendations as an analyst on the ForestQuery team. 
●	What have you learned from the World Bank data? 
●	Which countries should we focus on over others?

5. APPENDIX: SQL Queries Used

![image](https://github.com/shahrat18/shahrat_deforestation/assets/161549196/591a7159-9bdc-4705-af4a-b25d71e7acef)
