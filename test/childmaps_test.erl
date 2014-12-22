-module(childmaps_test).
-author('bumblehead <chris@bumblehead.com>').

-include_lib("eunit/include/eunit.hrl").

%% is_output_test() ->
%%     io:format(user, "output this to eunit console ~w", [{this}]).

is_childmap_list_test() ->
    NEWMAP = childmaps:to_list(
               [<<"prop1">>, 
                <<"prop2">>],
               #{
                 <<"prop1">> => #{
                   <<"prop1mapprop1">> => <<"prop1mapval1">>,
                   <<"prop1mapprop2">> => <<"prop1mapval2">>
                  },
                 <<"prop2">> => #{
                     <<"prop2mapprop1">> => <<"prop2mapval1">>
                    }
                }),
    ?assert(length(maps:get(<<"prop1">>, NEWMAP)) =:= 2).
