-- 04_assertions.sql
-- Automated data-integrity checks for the pharmaceutical database.
-- Each block raises an exception (which fails the CI run) if a rule is violated.

-- 1. All five expected tables exist
DO $$
DECLARE
    missing text;
BEGIN
    SELECT string_agg(t, ', ') INTO missing
    FROM unnest(ARRAY['drug', 'drugformulation', 'countries', 'sales', 'costs']) AS t
    WHERE NOT EXISTS (
        SELECT 1 FROM information_schema.tables
        WHERE lower(table_name) = t
    );
    IF missing IS NOT NULL THEN
        RAISE EXCEPTION 'Missing expected table(s): %', missing;
    END IF;
END $$;

-- 2. No sale has a quantity of zero or less
DO $$
DECLARE
    bad_count integer;
BEGIN
    SELECT count(*) INTO bad_count FROM sales WHERE quantitysold <= 0;
    IF bad_count > 0 THEN
        RAISE EXCEPTION '% Sales row(s) have quantitysold <= 0', bad_count;
    END IF;
END $$;

-- 3. No sale price is negative
DO $$
DECLARE
    bad_count integer;
BEGIN
    SELECT count(*) INTO bad_count FROM sales WHERE salepriceperunit < 0;
    IF bad_count > 0 THEN
        RAISE EXCEPTION '% Sales row(s) have a negative saleprice', bad_count;
    END IF;
END $$;

-- 4. No cost record is negative
DO $$
DECLARE
    bad_count integer;
BEGIN
    SELECT count(*) INTO bad_count FROM costs
    WHERE manufacturingcostperunit < 0 OR shippingcostperunit < 0;
    IF bad_count > 0 THEN
        RAISE EXCEPTION '% Costs row(s) have a negative manufacturing or shipping cost', bad_count;
    END IF;
END $$;

-- 5. DrugFormulation is unique by (DrugID, DosageForm, Strength)
DO $$
DECLARE
    dup_count integer;
BEGIN
    SELECT count(*) INTO dup_count FROM (
        SELECT drugid, dosageform, strength
        FROM drugformulation
        GROUP BY drugid, dosageform, strength
        HAVING count(*) > 1
    ) dups;
    IF dup_count > 0 THEN
        RAISE EXCEPTION '% duplicate DrugFormulation row(s) found (same drug, dosage form, and strength)', dup_count;
    END IF;
END $$;



-- If every block above passes without raising, this prints as confirmation.
SELECT 'All data-integrity assertions passed.' AS result;
