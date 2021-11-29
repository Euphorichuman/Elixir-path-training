import Config
config :mix_test, :routing_table, [{?a..?z, node()}]

if config_env() == :prod do
  config :mix_test, :routing_table, [
    {?a..?m, :"foo@computer-name"},
    {?n..?z, :"bar@computer-name"}
  ]
end
