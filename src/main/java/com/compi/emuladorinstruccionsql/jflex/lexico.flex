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

"SELECCIONAR" {return new Symbol(sym.SELECCIONAR,yyline, (int) yychar, yytext());}
"FILTRAR" {return new Symbol(sym.FILTRAR,yyline, (int) yychar, yytext());}
"INSERTAR" {return new Symbol(sym.INSERTAR,yyline, (int) yychar, yytext());}
"VALORES" {return new Symbol(sym.VALORES,yyline, (int) yychar, yytext());}
"ACTUALIZAR" {return new Symbol(sym.ACTUALIZAR,yyline, (int) yychar, yytext());}
"ASIGNAR" {return new Symbol(sym.ASIGNAR,yyline, (int) yychar, yytext());}
"EN" {return new Symbol(sym.EN,yyline, (int) yychar, yytext());}
"OR" {return new Symbol(sym.OR,yyline, (int) yychar, yytext());}
"AND" {return new Symbol(sym.AND,yyline, (int) yychar, yytext());}
"=" {return new Symbol(sym.EQUALS,yyline, (int) yychar, yytext());}
"<" {return new Symbol(sym.MENORQ,yyline,  (int) yychar, yytext());}
">" {return new Symbol(sym.MAYORQ,yyline, (int) yychar, yytext());}
";" {return new Symbol(sym.SEMICOLON,yyline, (int) yychar, yytext());} 
"(" {return new Symbol(sym.PARIZQ,yyline, (int) yychar, yytext());} 
")" {return new Symbol(sym.PARDER,yyline, (int) yychar, yytext());}
"+" {return new Symbol(sym.PLUS,yyline,  (int) yychar, yytext());} 
"-" {return new Symbol(sym.MINUS,yyline,  (int) yychar, yytext());} 
"*" {return new Symbol(sym.TIMES,yyline, (int) yychar, yytext());} 
"/" {return new Symbol(sym.DIVIDE,yyline,  (int) yychar, yytext());} 

\n {yychar=1;}

{BLANCOS} {} 
{ENTERO} {return new Symbol(sym.ENTERO,yyline, (int) yychar, yytext());} 
{DECIMAL} {return new Symbol(sym.DECIMAL,yyline, (int) yychar, yytext());} 
{COLUMNA} {return new Symbol(sym.COLUMNA,yyline, (int) yychar, yytext());} 
{ARCHIVO} {return new Symbol(sym.ARCHIVO,yyline, (int) yychar, yytext());} 
{STRING} {return new Symbol(sym.STRING,yyline, (int) yychar, yytext());} 

. {
	System.out.println("Este es un error lexico: "+yytext()+
	", en la linea: "+yyline+", en la columna: "+yychar);
}