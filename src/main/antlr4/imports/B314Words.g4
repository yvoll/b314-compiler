lexer grammar B314Words;

// Words

AFFECT:'affect';
LPAR:'(';
RPAR:')';
LCRO:'[';
RCRO:']';
COMMA:',';
PLUS:'+';
MINUS:'-';
MULT:'*';
DIV:'/';
MODU:'%';
BOOLEAN:'boolean';
INTEGER:'integer';
SQUARE:'square';
DECLARE:'declare and retain';
PVIRG:';';
DPOINT:':';
TURN:'when your turn';
GRID:'grid size';
LONGITUDE:'longitude';
LATITUDE:'latitude';
COUNT:'count';
LIFE:'life';
TRUE:'true';
FALSE:'false';
ENEMYIS:'enemy is';
GRAALIS:'graal is';
NORTH:'north';
SOUTH:'south';
EAST:'east';
WEST:'west';
AND:'and';
OR:'or';
NOT:'not';
PPLUS:'>';
MMINUS:'<';
EGAL:'=';
DIRT:'dirt';
ROCK:'rock';
VINES:'vines';
ZOMBIE:'zombie';
PLAYER:'player';
ENEMY:'ennemi';
MAP:'map';
RADIO:'radio';
AMMO:'ammo';
FRUITS:'fruits';
SODA:'soda';
GRAAL:'graal';
NEARBY: 'nearby';
SKIPY:'skip';
IF:'if';
THEN:'then';
DONE:'done';
WHILE:'while';
ELSE:'else';
SET:'set';
TO:'to';
COMPUTE:'compute';
NEXT:'next';
MOVE:'move';
SHOOT:'shoot';
USE:'use';
DONOTHING:'do nothing';
ASFUNCT:'as function';
VOID:'void';
DECLOC:'declare local';
DO:'do';
RETURN:'return';
AS:'as';
IMPORT:'import';
WLD:'.wld';
WHEN:'when';
BYDEFAULT:'by default';


// Identifiers

ID:LETTER(LETTER|CHIFFRE)*;

ENTIER:'-'?(CHIFFRE)+;

fragment LETTER:'A'..'Z' | 'a'..'z';
fragment CHIFFRE:'0'..'9';

// Comments -> ignored

COMMENTS : '/*'.*?'*/' -> skip;


// Whitespaces -> ignored

NEWLINE: '\r'? '\n'  -> skip ;
WS: [ \t]+ -> skip ;