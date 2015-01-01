-module(childmaps_test).
-author('bumblehead <chris@bumblehead.com>').

-include_lib("eunit/include/eunit.hrl").

%% is_output_test() ->
%%     io:format(user, "output this to eunit console ~w", [{this}]).

is_childmap_list_test() ->
    [{<<"prop1">>,
      [{<<"prop1mapprop1">>,<<"prop1mapval1">>},
       {<<"prop1mapprop2">>,<<"prop1mapval2">>}]},
     {<<"prop2">>,
      [{<<"prop2mapprop1">>,<<"prop2mapval1">>}]}] =
        childmaps:to_list(
          #{<<"prop1">> => #{
                <<"prop1mapprop1">> => <<"prop1mapval1">>,
                <<"prop1mapprop2">> => <<"prop1mapval2">>},
            <<"prop2">> => #{
                <<"prop2mapprop1">> => <<"prop2mapval1">>}}).

is_childmap_list2_test() ->
    [{<<"prop0">>,1},
     {<<"prop1">>,
      [{<<"prop1mapprop1">>,<<"prop1mapval1">>},
       {<<"prop1mapprop2">>,<<"prop1mapval2">>}]},
     {<<"prop2">>,
      [{<<"prop2mapprop1">>,<<"prop2mapval1">>}]},
     {<<"prop3">>,null}] = 
        childmaps:to_list(
          #{<<"prop0">> => 1,
            <<"prop1">> => #{
                <<"prop1mapprop1">> => <<"prop1mapval1">>,
                <<"prop1mapprop2">> => <<"prop1mapval2">>},
            <<"prop2">> => #{
                <<"prop2mapprop1">> => <<"prop2mapval1">>},
            <<"prop3">> => null}).

is_childmap_listnested_test() ->
    [{<<"nestedmap">>,
      [[{<<"prop0">>,<<"val0">>},
        {<<"prop1">>,
         [{<<"prop1mapprop1">>,<<"prop1mapval1">>},
          {<<"prop1mapprop2">>,
           <<"prop1mapval2">>}]}]]}] =
        childmaps:to_list(
          #{<<"nestedmap">> => 
                [#{<<"prop0">> => <<"val0">>,
                   <<"prop1">> => #{
                       <<"prop1mapprop1">> => <<"prop1mapval1">>,
                       <<"prop1mapprop2">> => <<"prop1mapval2">>}}]}).
    







