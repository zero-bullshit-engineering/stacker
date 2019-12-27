FROM elixir
RUN mix local.hex --force && mix local.rebar --force
WORKDIR /src
ADD . /src
RUN mix deps.get && mix compile
ENTRYPOINT mix phx.server
