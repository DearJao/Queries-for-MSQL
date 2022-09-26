SELECT 
	u.user_name as usuario,
    IF(MAX(YEAR(r.reproduction_date)) < 2021, 'Usuário inativo', 'Usuário ativo') 
    AS status_usuario
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction_history AS r ON u.user_id = r.user_id
GROUP BY u.user_name
ORDER BY u.user_name;