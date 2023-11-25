-- Exercice 2

-- 1 - Accéder aux paramètres de V$rowchace
SELECT PARAMETER FROM V$rowcache;

-- 2 - Donner la requête SQL qui permet de vérifier s'il faut optimiser le dictionary cache ou pas
Select SUM(GETS) "Cumul des demandes", SUM(GETMISSES) "Cumul des demandes manquées", SUM(GETMISSES) / (SUM(GETS) + Sum(getmisses)) * 100 "Rapport" FROM V$rowcache;
-- Si le résultat est <= 10% ou 15%, le cache est bien optimisé.
-- Sinon, cela signifie qu'il faut augmenter la taille du SPA.

-- 3 - Ecrire la requête SQL qui permet de modifier SPA = 80M.
ALTER SYSTEM SET SHARED_POOL_SIZE = 80M;

-- 4 - Vérifier s'il faut augmenter la taille du library cache.
Select SUM(PINS) "Executions", SUM(RELOADS) "Defaut de cache", SUM(RELOADS) / (SUM(RELOADS) + Sum(PINS)) * 100 "Rapport" FROM V$librarycache;
-- Reloads: Nombre de demandes infructueuses
-- Pins : Nombre d’exécutions sans défaut de cache
-- il faut augmenter la taille si le résultant est >= 1%

-- 5 - Vérifier s'il faut augmenter la taille du library cache.
Select SUM(RELOADS) / (SUM(RELOADS) + Sum(PINS)) * 100 "R" FROM V$librarycache;