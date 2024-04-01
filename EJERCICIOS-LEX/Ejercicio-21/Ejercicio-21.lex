%{
    #include <stdio.h>
    #include <ctype.h>
%}
 
%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    
    for(int i = 0; yytext[i] != '\0'; i++) {
        yytext[i] = toupper(yytext[i]);
    }
    printf("Palabra reservada: %s\n", yytext);
}

"end" {
return 0;
}

%%
int yywrap(){}
int main(){
    yylex();
}