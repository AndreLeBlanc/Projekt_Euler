-module(problem_36).
-export([problem_36/0]).

problem_36() ->
    Start = os:timestamp(),
    Resultat = genPal(),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).

reverser(Num) ->
    Reversed = lists:reverse(integer_to_list(Num)),
    {Res, _} = string:to_integer(Reversed),
    Res.

bools(N) ->
    lists:sum(lists:filter(fun(X) -> integer_to_list(X, 2) == lists:reverse(integer_to_list(X, 2)) end, N)).

genPal() ->
    A = bools([100*X + Y + X || X <- lists:seq(1, 9), Y <- lists:seq(0, 90, 10)]), 
    B = bools([1000*X + Y + reverser(X) || X <- lists:seq(10, 99), Y <- lists:seq(0, 900, 100)]),  
    C = bools([10*X + reverser(X) || X <- lists:seq(1, 9)]), 
    D = bools([100*X + reverser(X) || X <- lists:seq(10, 99)]),
    E = bools([1000*X + reverser(X) || X <- lists:seq(100, 999)]),
    A + B + C + D + E + bools(lists:seq(1,9)).
