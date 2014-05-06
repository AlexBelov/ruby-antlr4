grammar ruby;

prog : expression_list;

expression_list : expression terminator
                | expression_list expression terminator
                ;

expression : rvalue;

rvalue : literal_t
       | bool_t
       | float_t
       | int_t
       | nil_t 
       ;

literal_t : LITERAL;

float_t : FLOAT;

int_t : INT;

bool_t : TRUE
       | FALSE
       ;

nil_t : NIL;

terminator : terminator SEMICOLON
           | terminator CRLF
           | SEMICOLON
           | CRLF
           ;

fragment ESCAPED_QUOTE : '\\"';
LITERAL : '"' ( ESCAPED_QUOTE | ~('\n'|'\r') )*? '"'
        | '\'' ( ESCAPED_QUOTE | ~('\n'|'\r') )*? '\'';

COMMA : ',';  
SEMICOLON : ';';
CRLF : '\n';

TRUE : 'true';
FALSE : 'false';

NIL : 'nil';

SL_COMMENT : '#' ~('\r' | '\n')* '\n' {skip();};
ML_COMMENT : '=begin' .*? '=end\n' {skip();};
WS : (' ')+ {skip();};

INT : [0-9]+;
FLOAT : [0-9]*'.'[0-9]+;
ID : [a-zA-Z_][a-zA-Z0-9_]*;