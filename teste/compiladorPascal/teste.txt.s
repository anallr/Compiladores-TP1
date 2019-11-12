; Codigo assembly simples para TESTE_ESCOPO_D.
; Os registradores A0...An sao argumentos de funcoes/procedimentos.
; O registrador V0 guarda retorno de funcoes.

	 LD SP , #stackStart
	 BR main 
f_sem_param: 
	 BR *0(SP) 
f_com_param: 
	 BR *0(SP) 
p_sem_param: 
	 ST var1 , 1
	 ST var2 , #99
	 BR *0(SP) 
p_com_param: 
	 ST var1 , #2
	 ST var3 , #'var3'
	 BR *0(SP) 
main: 
	 ST var1 , #2
	 ST var2 , #2.0
	 DIV R1 , #2 , #2.0
	 MUL R1 , #2 , #3
	 SUB R1 , #1 , R1
	 LD R2 , R1
	 DIV R2 , R2 , #4.0
	 ADD R1 , R1 , R2
	 ST var3 , R1
	 LD R1 , 1
	 OR R1 , R1 , 0
	 LD R1 , 
	 OR R1 , R1 , 
	 LD R0 , R1
	 NOT R0
	 LD R1 , R0
	 AND R1 , R1 , 0
	 AND R1 , R1 , 
	 OR R1 , R1 , R1
	 ST var4 , R1
	 ADD SP , SP , #caller.recordSize
	 ST 0(SP) , #here + 16
	 BR f_sem_param
	 SUB SP , SP , #caller.recordSize
	 ST Var7 , V0
	 LD A0 , #'1'
	 LD A1 , #'2'
	 LD A2 , #'3'
	 LD A3 , #500
	 ADD SP , SP , #caller.recordSize
	 ST 0(SP) , #here + 16
	 BR f_com_param
	 SUB SP , SP , #caller.recordSize
	 ST vAr2 , V0
	 LD R0 , 1
	 NOT R0
	 LD R1 , 1
	 AND R1 , R1 , R0
	 OR R1 , R1 , 0
$L1:
	 LD R0 , R1
	 SUB R0 , R0 , 1
	 BLTZ R0 , $L2
	 ST var1 , #9.0
	 LD A0 , #2
	 LD A1 , #4
	 LD A2 , #'123'
	 ADD SP , SP , #caller.recordSize
	 ST 0(SP) , #here + 16
	 BR p_com_param
	 SUB SP , SP , #caller.recordSize
	 BR $L1
$L2:
$L3:
	 ADD SP , SP , #caller.recordSize
	 ST 0(SP) , #here + 16
	 BR p_sem_param
	 SUB SP , SP , #caller.recordSize
	 LD R0 , var1
	 LD R0 , 
	 SUB R1 , R0 , 1
	 BEQZ R1 , $L3
$L4:
	 ST var10 , #'1'
$L5:
	 LD R4 , #'u'
	 LD R3 , var10
	 SUB R0 , R3 , R4
	 BGTZ R0 , $L6
	 ST var1 , #2.0
	 LD R3 , var10
	 ADD R3 , R3 , #1
	 ST var10 , R3
	 BR $L5
$L6:
	 HALT 


