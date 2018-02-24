-module(problem_6).
-export([problem_6/0]).

problem_6() ->
    Start = os:timestamp(),
    SumOfSquares = [X*X || X <- lists:seq(1, 100)],
    Sum = lists:sum(lists:seq(1, 100)),
    Res = (Sum*Sum) - lists:sum(SumOfSquares),
   io:format("Resultatet är ~poch det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).
