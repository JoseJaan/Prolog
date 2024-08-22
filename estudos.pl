disciplina(gac107). % GAC107 é uma disciplina.
disciplina(gac106). % GAC106 é uma disciplina.

esta_matriculado_em(allan, gac107).
esta_matriculado_em(andreia, gac107).
esta_matriculado_em(antonio, gac107).

pessoa(allan).
pessoa(andreia).
pessoa(antonio).

eh_professor_de(bruno, gac107). % Bruno é professor de GAC107.
eh_professor_de(bruno, gac106). % Bruno é professor de GAC106.
eh_professor_de(merschmann, gac106). %Merschmann é professor de GAC106.

% regra para relacionar quais docentes tem aula com quais discentes.

eh_professor_de(Docente, Discente) :-
esta_matriculado_em(Discente, Disciplina),
eh_professor_de(Docente, Disciplina).

% verifica se um elemento pertence à lista
pertence([E|_],E).
pertence([_|R],E) :-
    pertence(R,E).

% menor dentre dois números
menorDeDois(A,B,A) :-
    A =< B, !.
menorDeDois(_,B,B).

% menor dentre tres números
menorDeTres(A,B,C,Menor):-
    menorDeDois(A, B, MenorEntreAeB),
    menorDeDois(MenorEntreAeB, C, Menor).

% calcula fatorial de um numero
fatorial(0,1).
fatorial(E,F) :-
    EMenosUm is E - 1,
    fatorial(EMenosUm,FatorialEMenosUm),
    F is E*FatorialEMenosUm.


% retorna N-esimo elemento de uma lista
elemento([C|_],1,C).
elemento([_|R],N,E) :-
    NMenos1 is N-1,
    elemento(R,NMenos1,E).
    

