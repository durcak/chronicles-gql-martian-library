# app/graphql/types/subscription_type.rb

module Types
  class SubscriptionType < GraphQL::Schema::Object
    extend GraphQL::Subscriptions::SubscriptionRoot
    
    field :item_added, Types::ItemType, null: false, description: "An item was added"
    field :item_updated, Types::ItemType, null: false, description: "Existing item was updated"

    def item_added; end
    def item_updated; end
  end
end
