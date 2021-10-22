RESET:
	SEI          ; disable IRQs
	CLD          ; disable decimal mode
	LDX #$40	
	STX $4017    ; disable APU frame IRQ
	LDX #$FF	
	TXS          ; Set up stack
	INX          ; now X = 0
	STX $2000    ; disable NMI
	STX $2001    ; disable rendering
	STX $4010    ; disable DMC IRQs