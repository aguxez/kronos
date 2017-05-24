# Kronos

### Kronos is a simple wrapper around the Steam ReST API written in Elixir!

## Installation
First include `kronos` in your `mix.exs`.

```elixir
{:kronos, "~> 0.1.0"}
```

And make sure that it's initialized before your application:

```elixir
[extra_applications: :kronos, ...]
```

## Usage
Remember to set your the token Steam gives you on your `config.exs`.

```elixir
config :kronos, token: "your-token"
```

Or export the variable name as: `export STEAM_TOKEN="your-token"`.

Then put it on your Supervision tree or something:

```elixir
iex> Kronos.start_link() # If you set the variable before.

iex> Kronos.start_link("your-token") # Pass it directly if you didn't set it before.
```

Now start doing your stuff.

### TODO: There's a module that I didn't complete because I honestly didn't understand it and I didn't want to have it half complete, I just didn't even start it.
