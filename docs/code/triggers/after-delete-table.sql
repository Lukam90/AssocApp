DROP TRIGGER IF EXISTS after_delete_tables_number_on_reservation;

CREATE TRIGGER after_delete_tables_number_on_reservation
AFTER DELETE ON `table`
FOR EACH ROW
    UPDATE reservation
    SET number = (
        SELECT COUNT(t.id)
        FROM `table` t
    )
    WHERE id = OLD.reservation_id;