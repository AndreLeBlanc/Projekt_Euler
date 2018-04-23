-module(problem_97).
-export([problem_97/0]).

problem_97() ->
    Start = os:timestamp(),
    Res = (28433 * pow2(1,0) + 1) rem 10000000000,
    io:format("Resultatet: ~p och det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).

pow2(N, 7830450) ->
    pow3(N, 7830450);
pow2(N, Count) ->
    pow2((N*1024 rem 10000000000), Count+10).

pow3(N, 7830457) ->
    N;
pow3(N, Count) ->
    pow3((N*2 rem 10000000000), Count+1).
