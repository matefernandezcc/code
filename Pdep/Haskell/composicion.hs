import Text.Show.Functions

j numero = a numero + b numero

a = (*2)
b = (+3)

f numero = ((+) (a numero) . b) numero
f' numero = (.) ((+) (a numero)) b numero