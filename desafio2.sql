SELECT 
  COUNT(M.musica_id) AS cancoes, 
  COUNT(DISTINCT (A.artista_id)) AS artistas,
  COUNT(DISTINCT (Al.album_id)) AS albuns 
FROM SpotifyClone.Musicas AS M
INNER JOIN SpotifyClone.Albuns AS Al
ON M.album_id = Al.album_id
INNER JOIN SpotifyClone.Artistas AS A
ON Al.artista_id = A.artista_id