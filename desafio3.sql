SELECT 
  U.nome_user AS usuario, 
  COUNT(H.usuario_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(M.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.Usuarios AS U
 INNER JOIN SpotifyClone.Musicas AS M
 INNER JOIN SpotifyClone.historico_de_reproducoes AS H
 ON M.musica_id = H.musica_id 
 ON U.usuario_id = H.usuario_id
 GROUP BY nome_user
 ORDER BY nome_user ASC;