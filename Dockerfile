FROM elixir
RUN mix local.hex --force && mix local.rebar --force
WORKDIR /src
# Dependencies
ADD mix* /src/
RUN mix deps.get && MIX_ENV=prod mix deps.compile 

# App
ADD . /src
RUN MIX_ENV=prod mix release
EXPOSE 4000
EXPOSE 4444
ENTRYPOINT _build/prod/rel/stacker/bin/stacker start
