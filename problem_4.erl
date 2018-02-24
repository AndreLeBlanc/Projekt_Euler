%Skrivet av André Le Blanc
%Denna kod är ifrån detta blogginlägg:
%projekteuler.wordpress.com/2018/02/14/project-euler-problem-4/

-module(problem_4).
-export([problem_4/0, problem_4_snabbare/0]).

problem_4() ->
    Start = os:timestamp(),
    Listan = lists:seq(100,999),
    Pallar = [X*Y || X <- Listan, Y <- Listan, integer_to_list(X*Y) == lists:reverse(integer_to_list(X*Y))],
    Res = lists:max(Pallar),
    io:format("Resultatet: ~p och tog ~p sekunder att beräkna", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).

problem_4_snabbare() ->
    Start = os:timestamp(),
    Res = lists:max(pall(999)),
    io:format("Resultatet: ~p och tog ~p sekunder att beräkna", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).

pall(99) -> [];
pall(N) ->
    Listan = lists:seq(100,N),
    Pallar = [X*N || X <- Listan, integer_to_list(X*N) == lists:reverse(integer_to_list(X*N))],
    Pallar ++ pall(N-1).
