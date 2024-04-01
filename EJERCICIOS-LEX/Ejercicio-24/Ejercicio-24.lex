%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int countPRe=0;
    int countPNRe=0;
    int countLine=0;
    int countCarac=0;
    int countEsc=0;
 
%}
 
%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" {
    printf("Palabra reservada: %s\n",yytext);
    countPRe++;
 
}
 
[a-zA-Z][a-zA-Z0-9]+ {
    printf("Palabra no reservada: %s\n",yytext);
    countPNRe++;
}

. {
    printf("Otro Caracter: %s\n",yytext);
    countCarac++;
}

\n {
    printf("Lineas: %s\n",yytext);
    countLine++;
}
 
%%
int yywrap(){}
int main(){
    FILE *myfile = fopen("text_file.txt", "r");
    if(!myfile){
        printf("text_file.txt file failed to open.\n");
    }
 
    yyin = myfile;
 
    while(yylex());
    printf("Numero de palabras reservadas: %d\n", countPRe);
    printf("Numero de palabras no reservadas: %d\n", countPNRe);
    printf("Numero de lineas: %d\n", countLine);
    printf("Numero de caracteres sin clasificar: %d\n", countCarac);
    printf("Numero de caracteres de escape: %d\n", countEsc);
 
}