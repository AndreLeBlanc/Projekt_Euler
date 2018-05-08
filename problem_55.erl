-module(problem_55).
-export([problem_55/0]).

problem_55() ->
    Start = os:timestamp(),
    Res = length([X || X <- lists:seq(1, 9999), lychrel(X, 0)]),
    io:format("Resultatetr ~p och det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).

lychrel(_, 50) ->
    true;

lychrel(X, Count) ->
    Y = lists:reverse(integer_to_list(X)),
    case (integer_to_list(X) =/= Y) or (0 == Count) of
	true -> lychrel(X + list_to_integer(Y), Count + 1);
	false -> false
    end.
	    
