-module(problem_10).
-export([problem_10/0]).

problem_10() ->
    Start = os:timestamp(),
    Res = primes(lists:seq(3, 2000000,2)) + 2,
    io:format("Resultatet: ~p och det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).
 
primes([H|T]) when H > 1415 -> H + lists:sum(T);
primes([H|T]) -> 
    Sieved = [X || X <- T, X rem H =/= 0], 
    H + primes(Sieved).	 
    
