-module(problem_1).
-export([fiveThree/0]).

fiveThree() ->
    Start = os:timestamp(),
	Y = [X || X <- lists:seq(1, 999), (X rem 3 =:= 0) or (X rem 5 =:= 0)],
	Resultat = lists:sum(Y),
	io:format("Svaret är ~p och tog ~f sekunder att beräkna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000]).



