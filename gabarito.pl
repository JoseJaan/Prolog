pertence(E, [E|_]).
pertence(E, [_|R]) :-
    pertence(E, R).

nroElementos([_|R], N) :-
    nroElementos(R, Nmenos1),
    N is Nmenos1 + 1.
nroElementos([], 0).

maior([M], M) :- !.
maior([C|R], C) :-
    maior(R, MR),
    C > MR, !.
maior([_|R], M) :-
    maior(R, M).

nroOcorrencias(E, [E|R], N) :- !,
    nroOcorrencias(E, R, Nmenos1),
    N is Nmenos1 + 1.
nroOcorrencias(E, [_|R], N) :-
    nroOcorrencias(E, R, N).
nroOcorrencias(_, [], 0).

unicaoOcorrencia(E, [E|R]) :- !,
    not(pertence(E, R)).
unicaoOcorrencia(E, [_|R]) :-
    unicaoOcorrencia(E, R).

maioresQue(N, [C|R], Resultado) :-
    C > N, !,
    maioresQue(N, R, MaioresQueNnoResto).
maioresQue(N, [_|R], Maiores) :-
    maioresQue(N, R, Maiores).
maioresQue(_, [], []).
    
concatena([C1|R1], L2, [C1|R1comL2]) :-
    concatena(R1, L2, R1comL2).
    concatena([], L, L).

remove(E, [E|R], R) :- !.
remove(E, [C|R], [C|RsemE]) :-
    remove(E, R, RsemE).

removerUltimo([_], []) :- !.
removerUltimo([C|R], [C|RsemU]) :-
    removerUltimo(R, RsemU).

%Se os casos forem disjuntos, o mais específico deve vir por último.

removerRepetidos([C|R], RsemRep) :-
    removeTodos(C, R, RsemC),
    removerRepetidos(RsemC, RsemRep).
removerRepetidos([],[]).

removeTodos(E, [E|R], LsemE) :- !,
    removeTodos(E, R, LsemE).
removeTodos(E, [C|R], [C|RsemE]) :-
    removeTodos(E, R, RsemE).
removeTodos(_, [], []).