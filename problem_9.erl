-module(problem_9).
-export([problem_9/0, problem_9_snabbare/0]).

problem_9() ->
    Start = os:timestamp(),
    Nums = lists:seq(1,998),
    Res = [X*Y*Z || X <- Nums, Y <- Nums, Z <- Nums, math:sqrt((X*X)+(Y*Y)) == Z, X+Y+Z == 1000],
    io:format("Resultatet: ~p och tog ~p sekunder att beräkna", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).

problem_9_snabbare() ->
    Start = os:timestamp(),
    Res = solver(998, []),
    io:format("Resultatet: ~p och tog ~p sekunder", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).

solver(Z, []) -> 
    XY_vals = xyMaker(Z),
    Res = [element(1,X)*element(2,X)*Z || X <- XY_vals, math:sqrt(math:pow(element(1, X), 2) + math:pow(element(2, X), 2)) == Z],
    solver(Z-1, Res);
solver(_, [H|_]) -> H.

xyMaker(Z) ->
    X = lists:seq(1, 999-Z),
    [{X_val, (1000-Z-X_val)} || X_val <- X].

