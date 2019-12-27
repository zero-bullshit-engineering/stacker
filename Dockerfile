FROM elixir
RUN mix local.hex --force && mix local.rebar --force
WORKDIR /src
ADD . /src
ENV DATABASE_URL ecto://postgres:postgres@postgres/postgres
ENV SECRET_KEY_BASE ZoIYBMEfwUxleUB+lC18tH7PYXkwo7NqJMvfDx7Bav4xyi0vS0VXnxcU6JgSHsq3
RUN mix deps.get && MIX_ENV=prod mix compile
ENTRYPOINT MIX_ENV=prod mix phx.server
