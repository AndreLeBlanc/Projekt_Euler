-module(problem_25).
-export([problem_25/0]).

problem_25() ->
    Start = os:timestamp(),
    Max_Size = powers(10, 999, 1),
    Resultat = fib(1,1,2, Max_Size),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).

powers(N, 0, Count) ->
    Count;
powers(N, M, Count) ->
    powers(N, M-1, Count*N).

fib(N, _, Count, Max_Size) when N > Max_Size ->
    Count;
fib(N, N_Old, Count, Max_Size) -> 
    fib(N+N_Old, N, Count+1, Max_Size).
