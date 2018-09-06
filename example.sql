DECLARE @employee_ID int
DECLARE @count int=(Select count(*) from emplyees)

DECLARE exCursor CURSOR FOR  

SELECT employee_ID 
FROM emplyees
OPEN exCursor ;  
WHILE @count > 0  
   BEGIN  
	FETCH NEXT FROM exCursor into @employee_ID ;  

UPDATE emplyees
   SET [unique_employee_ID] = NEWID()
 WHERE employee_ID= @employee_ID
Set @count=@count-1
   END;  
CLOSE exCursor ;  
DEALLOCATE exCursor ;  
GO  
