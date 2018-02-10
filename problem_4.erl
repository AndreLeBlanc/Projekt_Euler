-module(problem_4).
-export([problem_4/0]).

problem_4() ->
    Start = os:timestamp(),
    Listan = lists:seq(100,999),
    Pallar = [X*Y || X <- Listan, Y <- Listan, integer_to_list(X*Y) == lists:reverse(integer_to_list(X * Y))],
    Res = lists:max(Pallar),
    io:format("Resultatet: ~p och tog ~p sekunder att beräkna", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).
