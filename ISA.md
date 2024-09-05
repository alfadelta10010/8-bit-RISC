# Instruction Set Architecture v1.1

- The ISA which the three of us decided upon when we were hungry. Absolutely nothing can go wrong :)

|r2|r1|r22|r12|F|F|Op|Code|Function|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|r2|r1|r22|r12|0|0|0|0|Logic NAND|
|r2|r1|r22|r12|1|0|0|0|Logic NOR|
|r2|r1|I|m|m|0|0|1|Branch BLT|
|r1|I|m|m|e|0|1|0|Load|
|r2|r1|r22|r12|0|0|1|1|Arithmetic ADD|
|r2|r1|r22|r12|1|0|1|1|Arithmetic SUB|
|r2|r1|r22|r12|0|1|0|0|Logic SRL|
|r2|r1|r22|r12|1|1|0|0|Logic SLL|
|r2|r1|I|m|m|1|0|1|Branch BEQ|
|r2|r1|I|m|m|1|1|0|Store|
|I|m|m|e|0|1|1|1|Jump|
|r2|r1|r22|r11|1|1|1|1|Move|
