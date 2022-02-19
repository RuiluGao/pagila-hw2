/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT distinct("Actor Name") 
FROM (
        SELECT first_name || ' ' || last_name as "Actor Name"
        FROM actor 
        JOIN film_actor USING (actor_id)
        JOIN (
                SELECT 
                film_id,unnest(special_features) as special_feature 
                FROM film
        ) t USING (film_id)
WHERE t.special_feature='Behind the Scenes'
) a
ORDER BY "Actor Name"; 
