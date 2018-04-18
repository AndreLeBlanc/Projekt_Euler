-module(problem_40).
-export([problem_40/0]).

problem_40() ->
    Start = os:timestamp(),
    Digits = lists:flatten([integer_to_list(X) || X <- lists:seq(1, 185186)]),
    Resultat = lists:foldl(fun(X, Sum) -> (lists:nth(X,Digits)-48) * Sum end, 1, [1,10,100,1000,10000,100000,1000000]),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]),
    Start2 = os:timestamp(),
    Digits2 = lists:flatten([integer_to_list(X) || X <- lists:seq(1, 185186)]),
    Resultat2 = multiply(Digits2, 1),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat2, timer:now_diff(os:timestamp(), Start2) / 1000000]).

multiply(_, 10000000) -> 1;
multiply(Digits, Place) ->
    (lists:nth(Place, Digits)-48) * multiply(Digits, Place*10).
