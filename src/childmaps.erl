-module(childmaps).
-author('bumblehead <chris@bumblehead.com>').

-export([to_list/2, 
         to_list/1,
         convertifmap/3]).

%% @doc Returns a new map created from the old map with named properties
%% converted from map to list.

convertifmap(Map, PropMapVal, PropMapName)
  when is_map(Map) and is_map(PropMapVal) ->
    maps:update(PropMapName, maps:to_list(PropMapVal), Map);
convertifmap(Map, _, _) ->
    Map.


to_list([], Map)
  when is_map(Map) -> 
    Map;
to_list([PropName|Rest], Map)
  when is_map(Map) ->
   to_list(Rest, convertifmap(Map, maps:get(PropName, Map), PropName));
to_list(_, Map) ->
    Map.
to_list(Map)
  when is_map(Map) ->
    KeyList = maps:keys(Map),
    to_list(KeyList, Map).
    
    

