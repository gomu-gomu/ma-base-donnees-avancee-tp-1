-- Exercice 1

-- 1 - Afficher les champs de la vue V$memory_dynamic_components
SELECT COLUMN_NAME FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = 'V$memory_dynamic_components';

-- 2 - Afficher les champs de la vue V$memory_dynamic_components
SELECT * FROM V$memory_dynamic_components;

-- 3 - Afficher uniquement les informations sur les composants ainsi que leurs tailles
SELECT COMPONENT, CURRENT_SIZE from V$memory_dynamic_components;

-- 4 - Ecrire l'instruction qui permet d'afficher le contenu de la SGA
SELECT * FROM V$SGA;