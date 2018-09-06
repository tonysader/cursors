DECLARE @person_ID int
DECLARE @count int=(Select count(*) from person)

DECLARE exCursor CURSOR FOR  

SELECT person_ID 
FROM dbo.person
OPEN exCursor ;  
WHILE @count > 0  
   BEGIN  
	FETCH NEXT FROM exCursor into @person_ID ;  

UPDATE person
   SET [unique_person_id] = NEWID()
 WHERE person_ID= @person_ID
Set @count=@count-1
   END;  
CLOSE exCursor ;  
DEALLOCATE exCursor ;  
GO  
