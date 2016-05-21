/* Define a grammar called Hello
 */

grammar OptiMath; 
//options {language= java;}
@members {String s;
	HashMap memory = new HashMap();	
}

// non- Terminals
	
//Grammar Rules
/*Parser Rules Start MUST with COMMON letters */
@header {
import java.util.*;
} 


equation : QUAD EOF {}|varmathexp EQUAL varmathexp EOF {};

varmathexp returns [Exp value] : term ADD varmathexp  {} 
            |term MINUS varmathexp {}
            | term;

term returns [Exp value1, Exp value2, String op] : factor MULT term {} 
       | factor DIV term {}
       | factor POW term {}
       | factor{};


factor returns [Exp value, String op] : trigexp LPAREN val RPAREN {
	$value = (Exp) new ExpVal($val.text);
	$op = $trigexp.text;}
       | logexp val RPAREN {
       	$value = (Exp) new ExpVal($val.text);
	    $op = $logexp.text;
	    }
       | val{
       	$value = (Exp) new ExpVal($val.text);
       };

trigexp returns [String value]:SIN {$value = $SIN.text;} 
        |COS {$value = $COS.text;}
        |TAN {$value = $TAN.text;}
        |ARCSIN {$value = $ARCSIN.text;}
        |ARCCOS {$value = $ARCCOS.text;}
        |ARCTAN {$value = $ARCTAN.text;}
        |SEC {$value = $SEC.text;}
        |CSEC {$value = $CSEC.text;}
        |COT {$value = $COT.text;}
        |ARCSEC {$value = $ARCSEC.text;}
        |ARCCSEC {$value = $ARCCSEC.text;}
        |ARCCOT {$value = $ARCCOT.text;};

logexp returns [String value]: LOG LPAREN val COMMA {}
        | LN LPAREN {} ;

val returns [Exp value] : ID {$value = (Exp)new ExpID($ID.text);}
    |NUM  {$value = (Exp) new ExpNum($NUM.text);}
    |cons {$value = (Exp) new ExpCons($cons.text);}
    | LPAREN varmathexp RPAREN {$value = new ExpVarexpression($varmathexp.text);};

cons returns [String value] :  Pi {$value = $Pi.text;}
     |Euler { $value = $Euler.text;};

// Token Stuff
//Lexer rules MUST start with CAPITAL letters
LPAREN      :     '('   ;     RPAREN            :     ')'         ;

SEMICOLON   :     ';'   ;     DOT               :     '.'         ;

DIV         :     '/'   ;     ADD               :     '+'         ;

MINUS       :     '-'   ;     MULT              :     '*'         ;

POW         :     '^'   ;     SIN               :     'sin'       ;

COS         :     'cos' ;     TAN               :     'tan'       ;

COT         :     'sin ';     SEC               :     'sec '      ;

CSEC        :     'csec';     ARCSIN            :     'arcsin '   ;

ARCCOS      :     'arccos';   ARCTAN            :     'arctan'    ;

ARCSEC      :     'arccsec';  ARCCOT            :     'arccot';  

ARCCSEC     :     'arccsec';  COMMA             :      ','   ;    

EQUAL       :      '=';       LOG               :      'log' ;  

LN          :      'ln';      Pi                :      'pi';

Euler       :      'euler';

r : ID '#' {s = $ID.text; System.out.println(s);} ;
ID: 'a'..'z'+ ;
WS: (' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

NUM : ('0'..'9')+ ('.' ('0'..'9')+)?;   // Math Integer and Decimal numbers 

QUAD : (NUM MULT ID POW '2' ADD NUM MULT ID  ADD NUM EQUAL '0') ; 
//ID : [a-zA-Z]+ ;                        // match lower-case identifiers

//WS : [ \t\r\n]+ -> skip ;               // skip spaces, tabs, newlines


