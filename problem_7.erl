-module(problem_7).
-export([problem_7/0]).

problem_7() ->
    Start = os:timestamp(),
    Primes = primes(lists:seq(3,110000,2)),
    Res = lists:nth(10000, Primes),
    io:format("Resultatet är ~poch det tog ~p sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start)/1000000]).
 
primes([]) -> [];
primes([H|T]) -> 
    Sieved = [X || X <- T, X rem H =/= 0], 
    [H|primes(Sieved)].	 
    
