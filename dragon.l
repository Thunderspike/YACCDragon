%{
    #define _INT_TYPE 1
    #define _CHAR_TYPE 2
    #define _BOOL_TYPE 3

    #include "dragon.tab.h"
%}

%option yylineno

id      [a-zA-Z]+
type    (int)|(char)|(bool)

%%
[{]         { 
                yylloc.first_column++;
                // printf("\nLBRACKET"); 
                return(LBRACKET); 
            }
[}]         { 
                yylloc.first_column++;
                // printf("\nRBRACKET"); 
                return(RBRACKET); 
            }
(int)       {
                yylloc.first_column+=3;
                yylval.enumVal = _INT_TYPE;
                return(TYPE_);
            }
(char)      {
                yylloc.first_column+=4;
                yylval.enumVal = _CHAR_TYPE;
                return(TYPE_);
            }
(bool)      {
                yylloc.first_column+=4;
                yylval.enumVal = _BOOL_TYPE;
                return(TYPE_);
            }
{id}	    {
                yylloc.first_column+=strlen(yytext); 
                yylval.strVal = yytext; 
                // printf("\nl_ID: %s", yytext);
                return(ID); 
            }
[;]         { 
                yylloc.first_column+=1; 
                // printf("\nl_ENDSTMT"); 
                return(ENDSTMT); 
            }
[\t]	    { yylloc.first_column+=5; }
[ ]         { yylloc.first_column++; }
[\n]        { 
                yylloc.first_line++; 
                yylloc.first_column = 0;
            }
.           ;

%%