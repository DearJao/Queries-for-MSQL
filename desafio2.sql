SELECT
(SELECT COUNT(*) FROM SpotifyClone.music) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artist) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albums) AS albuns;