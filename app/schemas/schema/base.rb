module Schema
  class Base
    %i[ validate validate! fully_validate ].each do |method_name|
      define_singleton_method method_name do |params, **options|
        JSON::Validator.send(method_name,
          const_get(options.delete(:schema) || constants.first),
          params,
          options.reverse_merge(strict: true, parse_data: false, insert_defaults: true)
        )
      end
    end
  end
end
