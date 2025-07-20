MODULE RAMTEXT
	
	implicit none;
	
	!!! VARIÁVEIS PARTICULARES DO MÓDULO
	integer, parameter, private :: RT_INT_KIND = 8;
	integer, parameter, private :: RT_MSG_LEN = 256;
	
	integer, parameter, private :: RT_NULLFILE_CODE = 1337;
	character(len=RT_MSG_LEN), private :: RT_NULLFILE_MSG = "File is null.";
	
	integer, parameter, private :: RT_CRZYLINE_CODE = 1338;
	character(len=RT_MSG_LEN), private :: RT_CRZYLINE_MSG = "Invalid line.";
	
	!!! VARIÁVEIS PÚBLICAS DO MÓDULO
		
	!!! TIPOS DERIVADOS
	include "types/RAMTXT.f90"
		
	CONTAINS
		include "rtReadFile.f90"
		include "rtClearFile.f90"
		include "rtGetLine.f90"
		include "rtGetNextLine.f90"
		
END MODULE RAMTEXT
