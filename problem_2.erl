-module(problem_2).
-export([problem_2/0]).

problem_2() ->
	Start = os:timestamp(),
	Resultat = even_euler(1, 1, 0),
	io:format("Svaret är ~p och tog ~f sekunder att beräkna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).

even_euler(N, N_minus_ett, Tot) when N < 4000000 ->
	case N rem 2 of
		0 -> even_euler(N + N_minus_ett, N, Tot + N);
		1 -> even_euler(N + N_minus_ett, N, Tot)
	end;

even_euler(_, _, Tot) -> Tot.