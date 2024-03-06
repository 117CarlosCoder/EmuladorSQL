package com.compi.emuladorinstruccionsql.jflex;
import java_cup.runtime.Symbol; 
import com.compi.emuladorinstruccionsql.jcup.sym;

%% 
%class Lexico
%public 
%line 
%char 
%cup 
%unicode
%ignorecase

%init{ 
	yyline = 1; 
	yychar = 1; 
%init} 

BLANCOS=[ \r\t]+
COLUMNA = [A-Za-z_][A-Za-z0-9_]*
ARCHIVO = [A-Za-z_][A-Za-z0-9_]*
ENTERO = [0-9]+
DECIMAL = [0-9]+("."[0-9]+)?
STRING = \"[^\"]*\"



%%

"SELECCIONAR" {return new Symbol(sym.SELECCIONAR, yytext());}
"FILTRAR" {return new Symbol(sym.FILTRAR, yytext());}
"INSERTAR" {return new Symbol(sym.INSERTAR, yytext());}
"VALORES" {return new Symbol(sym.VALORES, yytext());}
"ACTUALIZAR" {return new Symbol(sym.ACTUALIZAR, yytext());}
"ASIGNAR" {return new Symbol(sym.ASIGNAR, yytext());}
"EN" {return new Symbol(sym.EN, yytext());}
"OR" {return new Symbol(sym.OR, yytext());}
"AND" {return new Symbol(sym.AND, yytext());}
"=" {return new Symbol(sym.EQUALS, yytext());}
"<" {return new Symbol(sym.MENORQ, yytext());}
">" {return new Symbol(sym.MAYORQ, yytext());}
";" {return new Symbol(sym.SEMICOLON, yytext());} 
"(" {return new Symbol(sym.PARIZQ, yytext());} 
")" {return new Symbol(sym.PARDER, yytext());}
"+" {return new Symbol(sym.PLUS, yytext());} 
"-" {return new Symbol(sym.MINUS, yytext());} 
"*" {return new Symbol(sym.TIMES, yytext());} 
"/" {return new Symbol(sym.DIVIDE, yytext());} 

\n {yychar=1;}

{BLANCOS} {} 
{ENTERO} {return new Symbol(sym.ENTERO, yytext());} 
{DECIMAL} {return new Symbol(sym.DECIMAL, yytext());} 
{COLUMNA} {return new Symbol(sym.COLUMNA, yytext());} 
{ARCHIVO} {return new Symbol(sym.ARCHIVO, yytext());} 
{STRING} {return new Symbol(sym.STRING, yytext());} 

. {
	System.out.println("Este es un error lexico: "+yytext()+
	", en la linea: "+yyline+", en la columna: "+yychar);
}