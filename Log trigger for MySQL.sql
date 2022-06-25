DELIMITER $$

/* Trigger  for INSERT */
CREATE TRIGGER HistoryTableInsert AFTER INSERT ON OriginalTable FOR EACH ROW BEGIN
   DECLARE N DATETIME;
   SET N = now();
    
   INSERT INTO HistoryTable (Column1, Column2, ..., Columnn, StartDate, EndDate)
   VALUES (New.Column1, New.Column2, ..., New.Columnn, N, NULL);
END;

/* Trigger for DELETE */
CREATE TRIGGER HistoryTableDelete AFTER DELETE ON OriginalTable FOR EACH ROW BEGIN
   DECLARE N DATETIME;
   SET N = now();
    
   UPDATE HistoryTable
      SET EndDate = N
    WHERE Column1 = OLD.Column1
      AND EndDate IS NULL;
END;

/* Trigger for UPDATE */
CREATE TRIGGER HistoryTableUpdate AFTER UPDATE ON OriginalTable FOR EACH ROW BEGIN
   DECLARE N DATETIME;
   SET N = now();

   UPDATE HistoryTable
      SET EndDate = N
    WHERE Column1 = OLD.Column1
      AND EndDate IS NULL;

   INSERT INTO HistoryTable (Column1, Column2, ..., Columnn, StartDate, EndDate)
   VALUES (New.Column1, New.Column2, ..., New.Columnn, N, NULL);
END;
