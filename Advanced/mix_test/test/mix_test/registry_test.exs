defmodule MIX_TEST.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(MIX_TEST.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert MIX_TEST.Registry.lookup(registry, "shopping") == :error

    MIX_TEST.Registry.create(registry, "shopping")
    assert {:ok, bucket} = MIX_TEST.Registry.lookup(registry, "shopping")

    MIX_TEST.Bucket.put(bucket, "milk", 1)
    assert MIX_TEST.Bucket.get(bucket, "milk") == 1
  end
end
