SELECT 
	a.artist AS artista,
    ab.album AS album,
    COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.albums AS ab on ab.artist_id = a.artist_id
INNER JOIN SpotifyClone.followed_artist AS f ON f.artist_id = a.artist_id
GROUP BY ab.album, a.artist
ORDER BY seguidores DESC, artist , album;