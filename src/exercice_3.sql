-- Exercice 3

-- 1 - Donner la requête SQL qui permet d'afficher les information contenues dans la vue v$systat
SELECT * FROM V$sysstat;

-- 2 - Appliquer la formule qui permet de vérifier si la mémoire data base buffer cache est suffisante ou pas, pour savoire s'il faut augmenter la taille de la SGA, et afficher le résultat.
SELECT (1 - ((SUM(DECODE(NAME, 'physical reads', VALUE, 0)) / ((SUM(DECODE(NAME, 'db block gets', VALUE, 0)) + (SUM(DECODE(NAME, 'consistent gets', VALUE, 0)))))))) * 100 AS "R" FROM V$SYSSTAT;
-- Si R > 60% ou 70%, OK.