RESET:
    SEI
    CLD
    LDX #$40    
    STX $4017    
    LDX #$FF    
    TXS          
    INX          
    STX $2000    
    STX $2001    
    STX $4010
    