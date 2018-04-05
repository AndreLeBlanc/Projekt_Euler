%Skrivet av André Le Blanc
%Denna kod är ifrån detta blogginlägg:
%https://projekteuler.wordpress.com/2018/01/20/problem-1-multiplar-av-3-och-5/

-module(problem_1).
-export([fiveThree/0]).

fiveThree() ->
    Start = os:timestamp(),
    Y = [X || X <- lists:seq(1, 999), (X rem 3 =:= 0) or (X rem 5 =:= 0)],
    Resultat = lists:sum(Y),
    io:format("Svaret är ~p och tog ~f sekunder att beräkna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).



