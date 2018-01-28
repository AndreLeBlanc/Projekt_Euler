% Skrivet av André Le Blanc
% Denna kod är ifrån detta bloggilnägg:
% projekteuler.wordpress.com/2018/01/28/project-euler-14-longest-collatz-sequence/
-module(problem_14).
-export([collatzSeq/2, collatzFast/2, collatzProc/2]).

collatzFast(1, Acc) -> Acc;
collatzFast(N, Acc) when N rem 2 == 0 ->
    collatzFast(N div 2, Acc+1);
collatzFast(N, Acc) ->
    collatzFast(3*N+1, Acc+1).

collatzRange(Lo, Hi) ->
    X = [collatzFast(X, 1) || X <- lists:seq(Lo, Hi)],
    Res = Lo + maxZ(X, 0, 0, 0),
    master ! Res,
    exit(normal).

maxZ([], _, _, IndexOfMax) ->
    IndexOfMax;
maxZ([H|T], Index, Max, _) when H > Max ->
    maxZ(T, Index+1, H, Index);
maxZ([_|T], Index, Max, IndexOfMax) ->
    maxZ(T, Index+1, Max, IndexOfMax).

collatzProc(Lo, Hi) ->
    Start = os:timestamp(),
    register(master, self()),
    spawn(fun () ->
          collatzRange(Lo, Hi div 2)
    end),
    spawn(fun () ->
         collatzRange(Hi div 2, Hi)
    end),
    io:format("Svaret är ~p och tog ~f sekunder att beräkna~n", [reciever(0, 0), timer:now_diff(os:timestamp(), Start) / 1000000]).
   
reciever(Antal, 2) -> Antal;

reciever(Antal, Count) ->
    receive
        Num when
            Num > Antal ->
                reciever(Num, Count + 1);
            Num when Num < Antal -> reciever(Antal, Count + 1)
    end.

collatzSeq(Lo, Hi) ->
    Start = os:timestamp(),
    Res = collatzSeqRec(Lo, Hi),
    io:format("Svaret är ~p och tog ~f sekunder att beräkna~n", [Res, timer:now_diff(os:timestamp(), Start) / 1000000]).
    
collatzSeqRec(Lo, Hi) ->
    X = [collatzFast(X, 1) || X <- lists:seq(Lo, Hi)],
    Lo + maxZ(X, 0, 0, 0).