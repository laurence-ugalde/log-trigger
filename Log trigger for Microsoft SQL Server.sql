CREATE TRIGGER TableTrigger ON OriginalTable FOR DELETE, INSERT, UPDATE AS

DECLARE @NOW DATETIME
SET @NOW = CURRENT_TIMESTAMP

UPDATE HistoryTable
   SET EndDate = @now
  FROM HistoryTable, DELETED
 WHERE HistoryTable.ColumnID = DELETED.ColumnID
   AND HistoryTable.EndDate IS NULL

INSERT INTO HistoryTable (ColumnID, Column2, ..., Columnn, StartDate, EndDate)
SELECT ColumnID, Column2, ..., Columnn, @NOW, NULL
  FROM INSERTED
