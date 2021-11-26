defmodule MixTest.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = MixTest.Bucket.start_link([])
    assert MixTest.Bucket.get(bucket, "milk") == nil

    MixTest.Bucket.put(bucket, "milk", 3)
    assert MixTest.Bucket.get(bucket, "milk") == 3
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(MixTest.Bucket, []).restart == :temporary
  end
end
