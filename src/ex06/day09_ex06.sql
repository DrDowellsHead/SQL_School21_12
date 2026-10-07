CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name VARCHAR
)
AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pizzeria.name
    FROM person

    JOIN person_visits
        ON person_visits.person_id = person.id

    JOIN pizzeria
        ON pizzeria.id = person_visits.pizzeria_id

    JOIN menu
        ON menu.pizzeria_id = pizzeria.id

    WHERE person.name = pperson
        AND menu.price < pprice
        AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;
