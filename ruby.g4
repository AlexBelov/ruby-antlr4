grammar ruby;

prog : expression_list;

expression_list : expression terminator
                | expression_list expression terminator
                ;

expression : function_definition
           | require_block
           | if_statement
           | unless_statement
           | rvalue
           | return_statement
           | while_statement
           ;

require_block : REQUIRE literal_t;

function_definition : function_definition_header function_definition_body END;

function_definition_body : expression_list;

function_definition_header : DEF function_name CRLF
                           | DEF function_name function_definition_params CRLF
                           ;

function_name : id_function
              | id
              ;

function_definition_params : LEFT_RBRACKET function_definition_params_list RIGHT_RBRACKET
                           | function_definition_params_list
                           ;

function_definition_params_list : id
                                | function_definition_params_list COMMA id
                                ;

return_statement : RETURN rvalue;

function_call : function_name LEFT_RBRACKET function_call_param_list RIGHT_RBRACKET
              | function_name function_call_param_list
              ;

function_call_param_list : function_call_params;

function_call_params : rvalue
                     | function_call_params COMMA rvalue
                     ;

if_elsif_statement : ELSIF rvalue CRLF expression_list
                   | ELSIF rvalue CRLF expression_list ELSE CRLF expression_list
                   | ELSIF rvalue CRLF expression_list if_elsif_statement
                   ;

if_statement : IF rvalue CRLF expression_list END
             | IF rvalue THEN expression_list END
             | IF rvalue CRLF expression_list ELSE CRLF expression_list END
             | IF rvalue THEN expression_list ELSE expression_list END
             | IF rvalue CRLF expression_list if_elsif_statement END
             ;

unless_statement : UNLESS rvalue CRLF expression_list END;

while_statement : WHILE rvalue CRLF while_expression_list END;

while_expression_list : expression terminator
                      | RETRY terminator
                      | BREAK terminator
                      | while_expression_list expression terminator
                      | while_expression_list RETRY terminator
                      | while_expression_list BREAK terminator
                      ;

assignment : lvalue ASSIGN rvalue
           | lvalue PLUS_ASSIGN rvalue
           | lvalue MINUS_ASSIGN rvalue
           | lvalue MUL_ASSIGN rvalue
           | lvalue DIV_ASSIGN rvalue
           | lvalue MOD_ASSIGN rvalue
           | lvalue EXP_ASSIGN rvalue
           ;

lvalue : id
       | id_global
       ;

rvalue : lvalue 
       | assignment
       | function_call
       | literal_t
       | bool_t
       | float_t
       | int_t
       | nil_t 

       | rvalue EXP rvalue

       | NOT rvalue
       | BIT_NOT rvalue

       | rvalue MUL rvalue
       | rvalue DIV rvalue
       | rvalue MOD rvalue

       | rvalue PLUS rvalue
       | rvalue MINUS rvalue

       | rvalue BIT_SHL rvalue
       | rvalue BIT_SHR rvalue

       | rvalue BIT_AND rvalue

       | rvalue BIT_OR rvalue
       | rvalue BIT_XOR rvalue

       | rvalue EQUAL rvalue
       | rvalue NOT_EQUAL rvalue
       | rvalue LESS_EQUAL rvalue
       | rvalue LESS rvalue
       | rvalue GREATER rvalue
       | rvalue GREATER_EQUAL rvalue

       | rvalue OR rvalue
       | rvalue AND rvalue     
       ;

literal_t : LITERAL;

float_t : FLOAT;

int_t : INT;

bool_t : TRUE
       | FALSE
       ;

nil_t : NIL;

id : ID;

id_global : ID_GLOBAL;

id_function : ID_FUNCTION;

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

REQUIRE : 'require';
END : 'end';
DEF : 'def';
RETURN : 'return';

IF: 'if';
THEN : 'then';
ELSE : 'else';
ELSIF : 'elsif';
UNLESS : 'unless';
WHILE : 'while';
RETRY : 'retry';
BREAK : 'break';

TRUE : 'true';
FALSE : 'false';

PLUS : '+';
MINUS : '-';
MUL : '*';
DIV : '/';
MOD : '%';
EXP : '**';

EQUAL : '==';
NOT_EQUAL : '!=';
GREATER : '>';
LESS : '<';
LESS_EQUAL : '<=';
GREATER_EQUAL : '>=';

ASSIGN : '=';
PLUS_ASSIGN : '+=';
MINUS_ASSIGN : '-=';
MUL_ASSIGN : '*=';
DIV_ASSIGN : '/=';
MOD_ASSIGN : '%=';
EXP_ASSIGN : '**=';

BIT_AND : '&';
BIT_OR : '|';
BIT_XOR : '^';
BIT_NOT : '~';
BIT_SHL : '<<';
BIT_SHR : '>>';

AND : 'and' | '&&';
OR : 'or' | '||';
NOT : 'not' | '!';

LEFT_RBRACKET : '(';
RIGHT_RBRACKET : ')';

NIL : 'nil';

SL_COMMENT : '#' ~('\r' | '\n')* '\n' {skip();};
ML_COMMENT : '=begin' .*? '=end\n' {skip();};
WS : (' '|'\t')+ {skip();};

INT : [0-9]+;
FLOAT : [0-9]*'.'[0-9]+;
ID : [a-zA-Z_][a-zA-Z0-9_]*;
ID_GLOBAL : '$'ID;
ID_FUNCTION : ID[!?];
