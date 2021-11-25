defmodule MIX_TEST.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    _ = start_supervised!({MIX_TEST.Registry, name: context.test})
    %{registry: context.test}
  end

  test "spawns buckets", %{registry: registry} do
    assert MIX_TEST.Registry.lookup(registry, "shopping") == :error

    MIX_TEST.Registry.create(registry, "shopping")
    assert {:ok, bucket} = MIX_TEST.Registry.lookup(registry, "shopping")

    MIX_TEST.Bucket.put(bucket, "milk", 1)
    assert MIX_TEST.Bucket.get(bucket, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    MIX_TEST.Registry.create(registry, "shopping")
    {:ok, bucket} = MIX_TEST.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)

    # Do a call to ensure the registry processed the DOWN message
    _ = MIX_TEST.Registry.create(registry, "bogus")
    assert MIX_TEST.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    MIX_TEST.Registry.create(registry, "shopping")
    {:ok, bucket} = MIX_TEST.Registry.lookup(registry, "shopping")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)

    # Do a call to ensure the registry processed the DOWN message
    _ = MIX_TEST.Registry.create(registry, "bogus")
    assert MIX_TEST.Registry.lookup(registry, "shopping") == :error
  end
end
