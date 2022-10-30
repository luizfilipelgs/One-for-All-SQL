SELECT
M.musica AS cancao,
COUNT(H.musica_id) AS reproducoes
FROM  SpotifyClone.Musicas AS M
INNER JOIN  SpotifyClone.historico_de_reproducoes AS H
ON M.musica_id = H.musica_id
GROUP BY musica
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
