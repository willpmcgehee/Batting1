This represents a first step in familarising myself with baseball statistics.

I wanted to know generally speaking which batting statistics are more important than others. 
I used a SQL script to pull batting statistics for each team since 1950 then used the very basic
pandas describe and correlation features to determine which batting statistics were most correlated
to Hit/League Average and Games Won/Games Lost. 

From these basic queries, it would seem that BA and SLG are less correlated to to Wins/Losses and Hits/Avg than OBP and OPS.
OPS would seem to the be the most highly correlated. 

For my own memory:
AVG OPS per Team: 0.7212
STD OPS per Team: 0.0451

Any OPS over 0.766 is pretty good.
