SELECT
  U.nome_user AS usuario,
  IF (MAX(YEAR(data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.Usuarios AS U
INNER JOIN SpotifyClone.historico_de_reproducoes AS H 
ON U.usuario_id = H.usuario_id
GROUP BY nome_user
ORDER BY nome_user ASC;