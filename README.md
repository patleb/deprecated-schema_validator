# SchemaValidator

### Usage

Just define a json schema definition and assign it to any constant within the class definition:

```ruby
# app/schemas/any_schema.rb

class AnySchema < Schema::Base
  SCHEMA_NAME = ::IceNine.deep_freeze(
    type: 'object', properties: {
      nested_blocks_attributes: {
        type: 'array', minItems: 1, items: {
          type: 'object', properties: {
            date: { type: 'string', format: 'date-time' },
            values: {
              type: 'object', properties: {
                attr_1: { type: 'array', items: { type: ['number', 'integer'] }, minItems: 5, maxItems: 5 },
                attr_2: { type: 'array', items: { type: ['number'] }, minItems: 4, maxItems: 4 },
                attr_3: { type: 'array', items: { type: ['integer'], minimum: 0, maximum: 1 }, minItems: 64, maxItems: 64 },
                attr_4: { type: 'array', items: { type: ['integer'] }, minItems: 4, maxItems: 4 },
              }
            }
          }
        }
      }
    }
  )
end
```

Then, you just need to call either `validate`, `validate!` or `fully_validate`:

```ruby
AnySchema.validate! params_hash
```

### Options

It's possible to have multiple schema definitions within the same class, the name must be specified in that case:

```ruby
AnySchema.validate! params_hash, schema: 'OTHER_SCHEMA_NAME'
```

Other options are the one in use with the [json-schema](https://github.com/ruby-json-schema/json-schema) gem.

Default options already set are `strict: true, parse_data: false, insert_defaults: true`.

Since most schema definitions are static configurations, `IceNine` deep_freeze is recommended and included within the gemspec.


This project rocks and uses MIT-LICENSE.
