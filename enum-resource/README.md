# Enum Resource

Writes an enumerated value in an S3 bucket, by delegating to [paas-s3-resource](https://github.com/alphagov/paas-s3-resource).

## Source Configuration

* `bucket`: *Required.* The name of the bucket.

* `region_name`: *Optional.* The region the bucket is in. Defaults to
  `us-east-1`.

* `versioned_file`: *Required.* The name of the enum resource.
* `valid_values`: *Required.* Json array of enumerated values e.g `["yes", "no"]`
* `default_value`: *Required.* Initial value of the resource e.g. `"no"`

## Behavior

* `check`: Extract enum value from the bucket, providing initial value if none has been set yet.
* `in`: Writes the enum value to a local file accessible to the task.
        Fails if the value is not one of `valid_values`.
* `out`: Writes the enum value given in the `value` param back to the S3 bucket.
         Fails if the value is not one of `valid_values`.

## Example Configuration

See [example_pipeline.yml](example_pipeline.yml)
