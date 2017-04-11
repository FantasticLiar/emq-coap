%%--------------------------------------------------------------------
%% Copyright (c) 2016-2017 Feng Lee <feng@emqtt.io>. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emq_coap_app).

-author("Feng Lee <feng@emqtt.io>").

-behaviour(application).

-include("emq_coap.hrl").
-export([start/2, stop/1]).


start(_Type, _Args) ->
    Ret = emq_coap_sup:start_link(application:get_env(?COAP_APP, listener, 5683)),
    emq_coap_server:register_handler("mqtt", emq_coap_gateway),
    Ret.

stop(_State) ->
    ok.

