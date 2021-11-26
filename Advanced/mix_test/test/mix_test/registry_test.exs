defmodule MixTest.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    _ = start_supervised!({MixTest.Registry, name: context.test})
    %{registry: context.test}
  end

  test "spawns buckets", %{registry: registry} do
    assert MixTest.Registry.lookup(registry, "shopping") == :error

    MixTest.Registry.create(registry, "shopping")
    assert {:ok, bucket} = MixTest.Registry.lookup(registry, "shopping")

    MixTest.Bucket.put(bucket, "milk", 1)
    assert MixTest.Bucket.get(bucket, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    MixTest.Registry.create(registry, "shopping")
    {:ok, bucket} = MixTest.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)

    # Do a call to ensure the registry processed the DOWN message
    _ = MixTest.Registry.create(registry, "bogus")
    assert MixTest.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    MixTest.Registry.create(registry, "shopping")
    {:ok, bucket} = MixTest.Registry.lookup(registry, "shopping")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)

    # Do a call to ensure the registry processed the DOWN message
    _ = MixTest.Registry.create(registry, "bogus")
    assert MixTest.Registry.lookup(registry, "shopping") == :error
  end
end
