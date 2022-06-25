-- Trigger for INSERT
CREATE TRIGGER Database.TableInsert AFTER INSERT ON Database.OriginalTable
REFERENCING NEW AS N
FOR EACH ROW MODE DB2SQL
BEGIN
   DECLARE Now TIMESTAMP;
   SET NOW = CURRENT TIMESTAMP;

   INSERT INTO Database.HistoryTable (Column1, Column2, ..., Columnn, StartDate, EndDate)
   VALUES (N.Column1, N.Column2, ..., N.Columnn, Now, NULL);
END;

-- Trigger for DELETE
CREATE TRIGGER Database.TableDelete AFTER DELETE ON Database.OriginalTable
REFERENCING OLD AS O
FOR EACH ROW MODE DB2SQL
BEGIN
   DECLARE Now TIMESTAMP;
   SET NOW = CURRENT TIMESTAMP;

   UPDATE Database.HistoryTable
      SET EndDate = Now
    WHERE Column1 = O.Column1
      AND EndDate IS NULL;
END;

-- Trigger for UPDATE
CREATE TRIGGER Database.TableUpdate AFTER UPDATE ON Database.OriginalTable
REFERENCING NEW AS N OLD AS O
FOR EACH ROW MODE DB2SQL
BEGIN
   DECLARE Now TIMESTAMP;
   SET NOW = CURRENT TIMESTAMP;

   UPDATE Database.HistoryTable
      SET EndDate = Now
    WHERE Column1 = O.Column1
      AND EndDate IS NULL;

   INSERT INTO Database.HistoryTable (Column1, Column2, ..., Columnn, StartDate, EndDate)
   VALUES (N.Column1, N.Column2, ..., N.Columnn, Now, NULL);
END;
