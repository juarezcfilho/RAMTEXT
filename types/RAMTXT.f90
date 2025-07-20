TYPE :: RAMTXT
	
	character(len=:), allocatable :: PATH, STRING;
	
	integer(kind=RT_INT_KIND) :: LAST_LINE_READ = 0;
	integer(kind=RT_INT_KIND), dimension(:, :), allocatable :: IDX;
	
END TYPE RAMTXT