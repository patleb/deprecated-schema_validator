class Product::Schema < Schema::Base
  COMMENTS = ::IceNine.deep_freeze(
    type: 'object', properties: {
      comments_attributes: {
        type: 'array', minItems: 1, items: {
          type: 'object', properties: {
            comment: { type: 'string' },
            timestamp: { type: 'string', format: 'date-time' },
            tags:    { type: 'array', items: { type: ['integer'] }, minItems: 1, maxItems: 2, default: [0] },
          }
        }
      }
    }
  )

  TAGS = ::IceNine.deep_freeze(
    type: 'object', properties: {
      tags_attributes: {
        type: 'array', items: {
          type: 'string'
        }
      }
    }
  )
end
