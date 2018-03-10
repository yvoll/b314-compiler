grammar B314;

import B314Words;

// Program

prog : DECLARE (monde|strategie) clauseDefault;

monde : (varDecl PVIRG|fctDecl)* (instruction)*;

strategie : (varDecl PVIRG|fctDecl|impDecl)* TURN (clauseWhen)*;

exprD : exprEnt
	    |exprBool
	    |exprCase
	    |exprG
	    |ID LPAR(exprD(COMMA exprD)*)? RPAR
	    |LPAR exprD RPAR;

exprEnt : (ENTIER
          |LATITUDE
          |LONGITUDE
          |GRID
          |(MAP|RADIO|AMMO|FRUITS|SODA)COUNT
          |LIFE
          |exprDHEE (PLUS|MINUS|MULT|DIV|MODU) exprD) exprEntG;

exprDHEE :  exprBool
	       |exprCase
	       |exprG
	       |ID LPAR (exprD(COMMA exprD)*)? RPAR
	       |LPAR exprD RPAR;

exprEntG : ((PLUS|MINUS|MULT|DIV|MODU) exprD exprEntG)?;

exprBool :(TRUE|FALSE|ENEMYIS(NORTH|SOUTH|EAST|WEST)|GRAALIS(NORTH|SOUTH|EAST|WEST)
          |(NOT exprD
	      |((ENTIER
		  |LATITUDE
		  |LONGITUDE
		  |GRID
		  |(MAP|RADIO|AMMO|FRUITS|SODA)COUNT
		  |LIFE) exprEntG
          |exprDHEEEB exprEntG?)(AND|OR|PPLUS|MMINUS|EGAL))exprD)exprBoolG ;

exprBoolG :((exprEntG(AND|OR|PPLUS|MMINUS|EGAL))exprD exprBoolG)?;

exprDHEEEB : exprCase
	        |exprG
	        |ID LPAR (exprD(COMMA exprD)*)? RPAR
	        |LPAR exprD RPAR;

exprCase : DIRT
		  |ROCK
		  |VINES
		  |ZOMBIE
		  |PLAYER
		  |ENEMY
		  |MAP
		  |RADIO
	 	  |AMMO
	 	  |FRUITS
	 	  |SODA
	 	  |GRAAL
	 	  |NEARBY LCRO exprD COMMA exprD RCRO;

exprG : ID|ID LCRO exprD (COMMA exprD)? RCRO;

instruction: SKIPY
		  |IF exprD THEN (instruction)+ DONE
		  |IF exprD THEN (instruction)+ ELSE (instruction)+ DONE
		  |WHILE exprD DO (instruction)+ DONE
		  |SET exprG TO exprD
		  |COMPUTE exprD
		  |NEXT action;

action : MOVE(NORTH|SOUTH|EAST|WEST)
		 |SHOOT(NORTH|SOUTH|EAST|WEST)
		 |USE(MAP|RADIO|FRUITS|SODA)
		 |DONOTHING;

fctDecl : ID ASFUNCT LPAR(varDecl(COMMA varDecl)*)?RPAR DPOINT (scalar|VOID)(DECLOC(varDecl PVIRG)+)? DO (instruction)+ RETURN ID PVIRG DONE;

varDecl: ID AS type;

type: scalar|array ;

scalar:BOOLEAN|INTEGER|SQUARE;

array:scalar LCRO(CHIFFRE)+(COMMA(CHIFFRE)+)?RCRO;


impDecl : IMPORT fileDecl;

fileDecl : ID WLD;

clauseDefault : BYDEFAULT (DECLOC (varDecl PVIRG)+)?
				DO (instruction)+ DONE;

clauseWhen : WHEN exprD (DECLOC (varDecl PVIRG)+)?
			 DO (instruction)+ DONE;