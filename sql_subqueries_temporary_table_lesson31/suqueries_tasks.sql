# 1. Quiz
# Find the number f events that occur for each day or each channel

SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel
ORDER BY events_count DESC;


# 2. Quiz
# Create a subquery that provides all of the data rom your first query. 

SELECT *
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel
ORDER BY events_count DESC) sub;


# 3. Quiz
# Find the average number of events or each channel.

SELECT channel,
	   AVG(events_count) as avg_events_count
FROM 
(SELECT DATE_TRUNC('day', occurred_at) as day,
		channel,
        COUNT(*) as events_count
FROM web_events
GROUP BY day, channel) sub
GROUP BY channel
ORDER BY avg_events_count DESC;