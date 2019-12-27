FROM elixir
RUN mix local.hex --force && mix local.rebar --force
WORKDIR /src
ADD . /src
RUN mix deps.get && MIX_ENV=prod mix release
ENTRYPOINT _build/prod/rel/stacker/bin/stacker start
