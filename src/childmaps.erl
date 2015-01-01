-module(childmaps).
-author('bumblehead <chris@bumblehead.com>').

-export([to_list/2]).
-export([to_list/1]).
-export([converted/3]).

%% @doc Returns a new map created from the old map with named properties
%% converted from map to list.

converted(Map, Val, Name) when is_map(Map) and is_map(Val) ->
    maps:update(Name, maps:to_list(Val), Map);
converted(Map, Val, Name) when is_map(Map) and is_list(Val) ->  
    maps:update(Name, to_list(Val), Map);
converted(Map, _, _) ->
    Map.


to_list([Head|Rest], Map) when is_map(Map) ->
   to_list(Rest, converted(Map, maps:get(Head, Map), Head));
to_list(_, Map) ->
    Map.

to_list([Head|[]]) -> 
    [to_list(Head)];
to_list([Head|Rest]) -> 
    [to_list(Head)|to_list(Rest)];

to_list(Map) when is_map(Map) ->
    maps:to_list(to_list(maps:keys(Map), Map)).
    
    

