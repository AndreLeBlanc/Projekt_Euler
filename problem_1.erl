-module(problem_1).
-export([fiveThree/0]).

fiveThree() ->
	Y = [X || X <- lists:seq(1, 999), (X rem 3 =:= 0) or (X rem 5 =:= 0)],
	lists:sum(Y).