CREATE OR REPLACE FUNCTION fnc_fibonacci(
    pstop INTEGER DEFAULT 10
)
RETURNS TABLE (
    fibonacci_number INTEGER
)
AS $$
DECLARE
    first_number INTEGER := 0;
    second_number INTEGER := 1;
    next_number INTEGER;
BEGIN
    WHILE first_number < pstop LOOP
        fibonacci_number := first_number;
        RETURN NEXT;

        next_number := first_number + second_number;
        first_number := second_number;
        second_number := next_number;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
