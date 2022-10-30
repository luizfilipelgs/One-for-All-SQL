SELECT
  A.artista AS artista, Al.album AS album
FROM SpotifyClone.Artistas AS A
INNER JOIN SpotifyClone.Albuns AS Al
  ON A.artista_id = Al.artista_id
  WHERE A.artista = 'Elis Regina'
ORDER BY album ASC;