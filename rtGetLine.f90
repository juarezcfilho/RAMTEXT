LOGICAL FUNCTION RT_GET_LINE(RT, LNUM, LINE, IOS, IOERR)
	
	implicit none;
	
	!!! VARIÁVEIS DE ENTRADA
	integer(kind=RT_INT_KIND), intent(IN) :: LNUM;
	
	!!! VARIÁVEIS DE ENTRADA/SAÍDA
	type(RAMTXT), intent(INOUT) :: RT;
	integer, intent(INOUT) :: IOS;
	character(len=*), intent(INOUT) :: IOERR;
	
	!!! VARIÁVEIS DE SAÍDA
	character(len=:), allocatable, intent(OUT) :: LINE;
	
	!!! VARIÁVEIS INTERNAS
	integer(kind=RT_INT_KIND) :: NUM_CHARS;
	
	!!! INÍCIO DA FUNÇÃO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	!!! PRESSUPOR RODADA MAL-SUCEDIDA
	RT_GET_LINE = .FALSE.;
	
	!!! VERIFICAR SE A LINHA É VÁLIDA
	IF ( (LNUM .LT. 1) .OR. (LNUM .GT. SIZE(RT%IDX, 2)) ) THEN
		
		IOS = RT_CRZYLINE_CODE;
		IOERR = RT_CRZYLINE_MSG;
		RETURN;
		
	END IF
	
	!!! ALOCAR A LINHA NA MEMÓRIA
	IF (ALLOCATED(LINE)) DEALLOCATE(LINE, STAT=IOS, ERRMSG=IOERR); ! JÁ ALOCADA
	IF (IOS .NE. 0) RETURN; ! ERRO NA DEALOCAÇÃO
	
	NUM_CHARS = RT%IDX(2, LNUM) - RT%IDX(1, LNUM) + 1;
	ALLOCATE (character(len=NUM_CHARS) :: LINE, STAT=IOS, ERRMSG=IOERR);
	IF (IOS .NE. 0) RETURN; ! ERRO NA ALOCAÇÃO
	
	!!! COLETAR A LINHA
	LINE(1:NUM_CHARS) = RT%STRING(RT%IDX(1, LNUM):RT%IDX(2, LNUM));
	
	!!! ATUALIZAR ÚLTIMA LINHA LIDA
	RT%LAST_LINE_READ = LNUM;
	
	!!! LEITURA BEM-SUCEDIDA
	RT_GET_LINE = .TRUE.;
	
END FUNCTION RT_GET_LINE
