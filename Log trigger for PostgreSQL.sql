CREATE OR REPLACE FUNCTION process_for_table() RETURNS TRIGGER AS $$
    DECLARE
        now TIMESTAMP := NOW();
    BEGIN
       --- deleting section

       IF (TG_OP = 'UPDATE' OR TG_OP = 'DELETE') THEN
       	UPDATE HistoricTable
       	   SET EndDate = now
       	  FROM HistoricTable AS H
       	 INNER JOIN old_table
       	    ON H.ColumnID = old_table.ColumnID
       	 WHERE HistoricTable.ColumnID = H.ColumnID
       	   AND HistoricTable.EndDate IS NULL;
       END IF;

       --- inserting section

       IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
          INSERT INTO HistoricTable
          SELECT ColumnID, Column2, ..., Columnn, now, NULL
            FROM new_table;
       END IF;
       
       RETURN NULL;
    END;
$$ LANGUAGE plpgsql

CREATE TRIGGER TriggerForTableInsert
    AFTER INSERT ON OriginalTable
    REFERENCING NEW TABLE AS new_table
    FOR EACH STATEMENT EXECUTE FUNCTION process_for_table();

CREATE TRIGGER TriggerForTableUpdate
    AFTER UPDATE ON OriginalTable
    REFERENCING OLD TABLE AS old_table NEW TABLE AS new_table
    FOR EACH STATEMENT EXECUTE FUNCTION process_for_table();

CREATE TRIGGER TriggerForTableDelete
    AFTER DELETE ON OriginalTable
    REFERENCING OLD TABLE AS old_table
    FOR EACH STATEMENT EXECUTE FUNCTION process_for_table();
