SELECT M.musica AS nome, COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.Musicas AS M
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
  ON M.musica_id = H.musica_id
INNER JOIN SpotifyClone.Usuarios AS U
  ON U.usuario_id = H.usuario_id
  AND (U.plano_id = 1 OR U.plano_id = 4)
GROUP BY M.musica
ORDER BY nome;