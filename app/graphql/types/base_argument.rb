class Types::BaseArgument < GraphQL::Schema::Argument
  def initialize(*args, camelize: false, **kwargs, &block)
    super(*args, camelize: camelize, **kwargs, &block)
  end
end
