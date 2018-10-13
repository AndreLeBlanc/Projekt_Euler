-module(problem_47).
-export([primes/1, problem_47/0]).

problem_47() ->
    Start = os:timestamp(),
    PrimList = primes([2|lists:seq(3, 719, 2)]),
    Resultat = problem_47_helper(210, PrimList, 0),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Resultat, timer:now_diff(os:timestamp(), Start) / 1000000]),
    PrimLis = primes([2|lists:seq(3, 719, 2)]),
    Res = problem_47_helper2(210, PrimLis, 0),
    io:format("Svaret är ~p och tog ~f sekunder att berakna~n", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).

problem_47_helper(Num, _, 4) ->
    Num-4;  

problem_47_helper(Num, PrimList, Cons) ->
 case num_div1(Num, PrimList) of
        4 -> problem_47_helper(Num+1, PrimList, Cons+1);
        _ -> problem_47_helper(Num+1, PrimList, 0)
 end.

num_div1(N, PrimList) ->
    length([X || X <- PrimList, N rem X =:= 0]).


problem_47_helper2(Num, _, 4) ->
    Num-4;  

problem_47_helper2(Num, PrimList, Cons) ->
 case num_divs(Num, PrimList, 0) of
        4 -> problem_47_helper(Num+1, PrimList, Cons+1);
        _ -> problem_47_helper(Num+1, PrimList, 0)
 end.

num_divs(1, _, Count) ->
    Count;
num_divs(_, [], Count) ->
    Count;
num_divs(Num, [H|T], Count) ->
    case Num rem H of
        0 -> num_divs(rem_fac(Num, H), T, Count+1);
        _ -> num_divs(Num, T, Count)
    end.

rem_fac(N, H) ->
    case N rem H =:= 0 of
        true -> rem_fac(N div H, H);
        _ -> N
    end.

primes([]) -> [];
primes([H|T]) -> 
    Sieved = [X || X <- T, X rem H =/= 0], 
    [H|primes(Sieved)].	 
