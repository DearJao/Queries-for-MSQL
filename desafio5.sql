SELECT 
	m.music as cancao,
	COUNT(r.music_id) as reproducoes
FROM SpotifyClone.music AS m
INNER JOIN SpotifyClone.reproduction_history AS r ON r.music_id = m.music_id
GROUP BY music
ORDER BY reproducoes DESC, music
limit 2;