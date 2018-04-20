-module(problem_63).
-export([problem_63/0]).

problem_63() ->
    Start = os:timestamp(),
    Powers = [pow(X, Y) || X <- lists:seq(1, 10), Y <- lists:seq(0, 100), powlength(X, Y)],
    Resultat = length(Powers),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).

powlength(X, Y) ->
    Power = pow(X, Y),
    Listified = integer_to_list(Power),
    length(Listified) == Y.
	    
pow(_, 0) -> 1;
pow(X, Y) -> X * pow(X, Y-1).
     
