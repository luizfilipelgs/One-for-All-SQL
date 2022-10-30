SELECT
  A.artista AS artista,
  Al.album AS album,
  COUNT(S.artista_id) AS seguidores
FROM SpotifyClone.Artistas AS A
INNER JOIN SpotifyClone.Albuns AS Al
  ON A.artista_id = Al.artista_id
INNER JOIN SpotifyClone.Seguindo AS S
  ON A.artista_id = S.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;