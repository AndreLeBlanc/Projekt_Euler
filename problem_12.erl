-module(problem_12).
-export([problem_12/0]).

facs(_, Fac, NumFacs, Root) when Root < Fac-> NumFacs;
facs(_, Fac, NumFacs, Root) when Root == Fac -> NumFacs + 1;
facs(Num, Fac, NumFacs, Root) when Num rem Fac == 0 ->
    facs(Num, Fac + 1, NumFacs + 2, Root);
facs(Num, Fac, NumFacs, Root) -> facs(Num, Fac + 1, NumFacs, Root).

problem_12() ->
    Start = os:timestamp(),
    Res = triangles(1, 2),
    io:format("Resultatetr ~p och det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).

triangles(Num, NewSide) ->
     case facs(Num, 1, 0, math:sqrt(Num)) < 500 of
	true -> triangles(Num + NewSide, NewSide+1);
	false -> Num
    end.
		     
