[2.7.2 The Use of Symbol Tables](<http://ce.sharif.edu/courses/94-95/1/ce414-2/resources/root/Text%20Books/Compiler%20Design/Alfred%20V.%20Aho,%20Monica%20S.%20Lam,%20Ravi%20Sethi,%20Jeffrey%20D.%20Ullman-Compilers%20-%20Principles,%20Techniques,%20and%20Tools-Pearson_Addison%20Wesley%20(2006).pdf>)

```
program     ->                      { top = null; }
                block
block       ->  '{'                 { saved = top;
                                      top = new Env(top);
                                      print("{ "); }
                decls stmts '}'     { top = saved;
                                      print("} "); }
decls       ->  decls decl
            |   ε
decl        ->  type id ;           { s = new Symbol;
                                      s.type = type.lexeme
                                      top.put(id.lexeme, s); }
stmts       ->  stmts stmt
            |   ε
stmt        ->  block
            |   factor ;            { print("; "); }
factor      ->  id                  { s = top.get(id.lexeme);
                                      print(id.lexeme);
                                      print(":"); }
                                      print(s.type);
```

```
{ 
    int x; char y;  ;
    {  
        bool y; x; y; z;
    } 
    x; y; 
}
```

to

```
{
    { x:int; y:bool; }
    x:int; y:char;
}
```
