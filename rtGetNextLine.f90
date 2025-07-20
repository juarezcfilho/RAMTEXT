LOGICAL FUNCTION RT_GET_NEXT_LINE(RT, LINE, IOS, IOERR)
	
	implicit none;
	
	!!! VARIÁVEIS DE ENTRADA/SAÍDA
	type(RAMTXT), intent(INOUT) :: RT;
	integer, intent(INOUT) :: IOS;
	character(len=*), intent(INOUT) :: IOERR;
	
	!!! VARIÁVEIS DE SAÍDA
	character(len=:), allocatable, intent(OUT) :: LINE;
	
	!!! VARIÁVEIS INTERNAS
	! NÃO HÁ.
	
	!!! INÍCIO DA FUNÇÃO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	!!! LER LINHA SEGUINTE À DE ÚLTIMO ACESSO REGISTRADO
	RT_GET_NEXT_LINE = RT_GET_LINE(RT, RT%LAST_LINE_READ + 1, LINE, IOS, IOERR);
	IF (RT_GET_NEXT_LINE .EQV. .FALSE.) RETURN; ! LEITURA MAL-SUCEDIDA.
	
	!!! REGISTRAR ÍNDICE DA LINHA ATUALMENTE LIDA
	RT%LAST_LINE_READ = RT%LAST_LINE_READ + 1;
	
END FUNCTION RT_GET_NEXT_LINE
