CREATE OR REPLACE TRIGGER TableTrigger
AFTER INSERT OR UPDATE OR DELETE ON OriginalTable
FOR EACH ROW
DECLARE Now TIMESTAMP;
BEGIN
   SELECT CURRENT_TIMESTAMP INTO Now FROM Dual;

   UPDATE HistoryTable
      SET EndDate = Now
    WHERE EndDate IS NULL
      AND Column1 = :OLD.Column1;

   IF :NEW.Column1 IS NOT NULL THEN
      INSERT INTO HistoryTable (Column1, Column2, ..., Columnn, StartDate, EndDate) 
      VALUES (:NEW.Column1, :NEW.Column2, ..., :NEW.Columnn, Now, NULL);
   END IF;
END;
