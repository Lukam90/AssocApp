DROP TRIGGER IF EXISTS after_insert_tables_number_on_reservation;

CREATE TRIGGER IF NOT EXISTS after_insert_tables_number_on_reservation
AFTER INSERT ON `table` 
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = NEW.reservation_id;