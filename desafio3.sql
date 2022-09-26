SELECT 
	u.user_name as usuario,
	COUNT(r.music_id) as qt_de_musicas_ouvidas,
    ROUND(SUM(m.duration_seconds / 60), 2) as total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction_history AS r ON u.user_id = r.user_id
INNER JOIN SpotifyClone.music AS m ON m.music_id = r.music_id
group by user_name
ORDER BY user_name;