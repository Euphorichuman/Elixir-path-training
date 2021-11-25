defmodule MIX_TEST.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = MIX_TEST.Bucket.start_link([])
    assert MIX_TEST.Bucket.get(bucket, "milk") == nil

    MIX_TEST.Bucket.put(bucket, "milk", 3)
    assert MIX_TEST.Bucket.get(bucket, "milk") == 3
  end
end
