Simple library to ease reading text files in Fortran. An example on how to use it is available below.

Pending: in-memory file editing, and output to disk functionality.

```
PROGRAM SAMPLE
	
	use RAMTEXT;
	implicit none;
	
	type(RAMTXT) :: RT;
	integer :: G_IOS;
	character(len=1024) :: G_IOERR;
	character(len=:), allocatable :: LINE;
	
	!!! SAMPLE CODE START !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!TISA80
	
	!!! FILE OPERATIONS ARE DONE THROUGH FUNCTIONS WHICH RETURN TRUE ON SUCCESS.
	
	! TRANSFER FILE INTO MEMORY
	IF (RT_READ_FILE("path/to/file.txt", G_IOS, G_IOERR, RT) .EQV. .FALSE.) THEN
		
		! FAILURE TO OPEN FILE.
		! IOMSG AND IOSTAT ARE SET BY RAMTEXT FUNCTIONS.
		PRINT *, "IOMSG: ", G_IOERR;
		PRINT *, "IOSTAT: ", G_IOS;
		STOP;
		
	END IF
	
	!!! READ FILE LINE BY LINE UNTIL EOF
	DO WHILE(RT_GET_NEXT_LINE(RT, LINE, G_IOS, G_IOERR) .NEQV. .FALSE.)
		
		! PRINTING: LINE NUMBER, LINE CONTENT (DYNAMICALLY ALLOCATED)
		PRINT *, RT%LAST_LINE_READ, ": ", LINE;
		
	END DO
	
	!!! PRINT A SPECIFIC LINE NUMBER (LINE 22 IN THIS EXAMPLE)
	IF (RT_GET_LINE(RT, 22, LINE, G_IOS, G_IOERR) .NEQV. .FALSE.)
		
		PRINT *, "LINE 22: ", LINE;
		
	ELSE
		
		PRINT *, "FAILED TO READ LINE 22!";
		PRINT *, "IOMSG: ", G_IOERR;
		PRINT *, "IOSTAT: ", G_IOS;
		STOP;
		
	END IF
	
END PROGRAM SAMPLE
```
