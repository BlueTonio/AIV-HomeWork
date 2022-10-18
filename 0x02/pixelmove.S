.org $8000
;.define pos $66

LDY $66
clear_screen:
LDA #0 
STA $0200,Y
RTS

start:
JSR moveInput
LDA #03
STA $0200,Y
JMP start

moveInput:
LDA $4000
CMP #$01
BEQ moveUp
CMP #$08
BEQ moveRight
CMP #$04
BEQ moveLeft
CMP #$02
BEQ moveDown
RTS


moveRight:
JSR clear_screen
INY
RTS

moveUp:
JSR clear_screen
TYA
ADC #$eF
TAY
RTS

moveLeft:
JSR clear_screen
DEY
RTS

moveDown:
JSR clear_screen
TYA
ADC #$0F
TAY
RTS

.goto $FFFA
.dw start ; non maskable
.dw start ; reset
.dw start ; interrupt