# Valvex

### Valvex is a simple wrapper around the Steam ReST API written in Elixir!

## Installation
First include `Valvex` in your `mix.exs`.

```elixir
{:valvex, "~> 0.1.0"}
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

### TODO: There's a module that I didn't complete because I honestly didn't understand it and I didn't want to have it half complete, I just didn't even start it.
