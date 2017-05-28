# Valvex

### Valvex is a simple wrapper around the Steam ReST API written in Elixir!

#### Check the [documentation](https://hexdocs.pm/valvex/Valvex.html#content) for the full API reference.

## Installation
First include `Valvex` in your `mix.exs`.

```elixir
{:valvex, "~> 0.3.0"}
```

And make sure that it's initialized before your application:

```elixir
[extra_applications: :valvex, ...]
```

## Usage
Remember to set your the token Steam gives you on your `config.exs`.

```elixir
config :valvex, token: "your-token"
```

Or export the variable name as: `export STEAM_TOKEN="your-token"`.

Then put it on your Supervision tree or something:

```elixir
iex> Valvex.start_link() # If you set the variable before.

iex> Valvex.start_link("your-token") # Pass it directly if you didn't set it before.
```

Now start doing your stuff.

### TODO:

1. There's a module that I didn't complete because I honestly didn't understand it and I didn't want to have it half complete, I just didn't even start it.

[This one](https://github.com/aguxez/valvex/blob/master/lib/valvex/api/stats_game.ex) If you're kind and would like to do it I would have absolutely no problem.

2. Add support for IEconService endpoints.
