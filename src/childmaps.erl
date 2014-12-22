-module(childmaps).
-author('bumblehead <chris@bumblehead.com>').

-export([to_list/2]).

%% @doc Returns a new map created from the old map with named properties
%% converted from map to list.

to_list([], Map)
  when is_map(Map) -> 
    Map;
to_list([PropName|Rest], Map)
  when is_map(Map) ->
    PropVal = maps:to_list(maps:get(PropName, Map)),
    MapVal = maps:update(PropName, PropVal, Map),
    to_list(Rest, MapVal).

