%{
    #define _INT_TYPE 1
    #define _CHAR_TYPE 2
    #define _BOOL_TYPE 3

    #include "dragon.tab.h"
    int lineno = 1;
%}

id      [a-zA-Z]+
type    (int)|(char)|(bool)
EOL     \n  

%%
[{]         { 
                // printf("\nLBRACKET"); 
                return(LBRACKET); 
            }
[}]         { 
                // printf("\nRBRACKET"); 
                return(RBRACKET); 
            }
(int)       {
                yylval.enumVal = _INT_TYPE;
                return(TYPE_);
            }
(char)      {
                yylval.enumVal = _CHAR_TYPE;
                return(TYPE_);
            }
(bool)      {
                yylval.enumVal = _BOOL_TYPE;
                return(TYPE_);
            }
{id}	    {
                yylval.strVal = yytext; 
                // printf("\nl_ID: %s", yytext);
                return(ID); 
            }
[;]         { 
                // printf("\nl_ENDSTMT"); 
                return(ENDSTMT); 
            }
{EOL}       { ++lineno; }
[\t ]	    ;
.           ;

%%