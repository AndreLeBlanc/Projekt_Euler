-module(problem_3).
-export([problem_3/0]).

problem_3(Num, Fac) when Num < Fac*Fac -> Num;
problem_3(Num, Fac) when Num rem Fac == 0 ->
    problem_3(Num div Fac, Fac);
problem_3(Num, Fac) -> problem_3(Num, Fac+2).

problem_3() ->
    Start = os:timestamp(),
    Res = problem_3(600851475143, 3),
    io:format("Resultatet är ~poch det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).
