defmodule MixTest.RouterTest do
  use ExUnit.Case

  setup_all do
    current = Application.get_env(:mix_test, :routing_table)

    Application.put_env(:mix_test, :routing_table, [
      {?a..?m, :"foo@DESKTOP-4OFGDR7"},
      {?n..?z, :"bar@DESKTOP-4OFGDR7"}
    ])

    on_exit(fn -> Application.put_env(:mix_test, :routing_table, current) end)
  end

  @tag :distributed
  test "route requests across nodes" do
    assert MixTest.Router.route("hello", Kernel, :node, []) ==
             :"foo@DESKTOP-4OFGDR7"

    assert MixTest.Router.route("world", Kernel, :node, []) ==
             :"bar@DESKTOP-4OFGDR7"
  end

  test "raises on unknown entries" do
    assert_raise RuntimeError, ~r/could not find entry/, fn ->
      MixTest.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end
