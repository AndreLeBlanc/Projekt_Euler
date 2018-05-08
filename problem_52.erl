-module(problem_52).
-export([problem_52/0, perms/1]).

problem_52() ->
    Start = os:timestamp(),
    Res = problem_52_helper(100008),
    io:format("Resultatet: ~p och det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).

problem_52_helper(A) ->
    A_list = integer_to_list(A),
    IsPerm  = [member(integer_to_list(A*X), A_list) || X <- lists:seq(2, 6)],
    case lists:member(false, IsPerm) of
	true -> problem_52_helper(A+9);
	false -> A
    end.	    

member([], _) -> true;
member([H|T], A) ->
    case lists:member(H, A) of
	true -> member(T, A);
	false -> false
    end. 

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

