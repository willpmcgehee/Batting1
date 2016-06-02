use stats;

#The purpose of this query is to generate batting statistics for each team
#In addition to Batting Average, Sluggin Percentage, On Base Percentage and On Base Plus Slugging,
#success statistics such as Wins Over Losses and Runs Over League Average have been included as well.

#Team Name and Year identifier information 
select yearID, name,
#Return Games Won over Games Lost
W/L as wins_over_losses,
#Return Runs over League Average
R/
	#This nested subquery returns the average runs generated in the league over the relevant year
	( 
		#This subquery returns total Runs in the relevant year
		(select sum(R) from teams as teams2 where teams1.yearID=teams2.yearID)
		/
		#This subquery returns the number of teams in a given year
		(select count(R) from teams as teams3 where teams1.yearID=teams3.yearID)
	) 
as runs_over_league_avg,
#Return Batting Average
H/AB as BA,
#Return Slugging Percentage
((H-2B-3B-HR)+(2B*2)+(3B*3)+(HR*4))/AB as SLG, #SLG is total bases over at bats
#Return On Base Percentage
(H+HBP+BB)/(AB+BB+HBP+SF) as OBP,
#Return On Base Percentage Plus Slugging Percentage
((H+HBP+BB)/(AB+BB+HBP+SF)) + (((H-2B-3B-HR)+(2B*2)+(3B*3)+(HR*4))/AB) as OPS
from teams as teams1
#Consider only statistics from 1951 and onwards
where yearID>1950;