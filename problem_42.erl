-module(problem_42).
-export([problem_42/1]).

problem_42(FileName) ->
    Start = os:timestamp(),
    {ok, Bin} = file:read_file(FileName),
    Resultat = tri(Bin),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]).

tri(Bin) ->
    Trianglar = triangel(),
    Words = string:tokens(binary:bin_to_list(Bin), ","),
    JustWords = lists:map(fun(X) -> string:strip(X, both, $") end, Words),
    TriangleWords = [ X || X <- JustWords, lists:member(wordNum(X), Trianglar)],
    length(TriangleWords).

wordNum(Word) -> 
    lists:sum([X - 64 || X <- Word]).
    
triangel() ->
    [X*(X+1) div 2 || X <- lists:seq(1, 26)].
