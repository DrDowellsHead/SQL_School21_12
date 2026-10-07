CREATE OR REPLACE FUNCTION func_minimum(
    VARIADIC arr NUMERIC[]
)
RETURNS NUMERIC
AS $$
    SELECT MIN(element)
    FROM unnest(arr) AS elements(element);
$$ LANGUAGE sql;
