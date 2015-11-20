%% -*- Mode: Erlang -*-
%% -------------------------------------------------------------------
%%
%% Copyright (c) 2015 Basho Technologies, Inc.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

-module(ts_A_put_non_existent_bucket).

%%
%% this test tries to write to a non-existent bucket
%%

-behavior(riak_test).

-export([
     confirm/0
    ]).

-include_lib("eunit/include/eunit.hrl").

confirm() ->
    ClusterType = single,
    DDL = ts_util:get_ddl(docs),
    Obj = [ts_util:get_invalid_obj()],
    Got = ts_util:ts_put(ts_util:cluster_and_connect(ClusterType), no_ddl, DDL, Obj),
    ?assertMatch({error, _}, Got),
    pass.


