SELECT 
	a.artist AS artista,
    ab.album AS album
FROM SpotifyClone.artist AS a
	INNER JOIN SpotifyClone.albums AS ab ON ab.artist_id = a.artist_id
WHERE a.artist LIKE 'Elis Regina';