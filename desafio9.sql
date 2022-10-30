SELECT COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.Usuarios AS U
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
  ON U.usuario_id = H.usuario_id
WHERE U.nome_user = 'Barbara Liskov';