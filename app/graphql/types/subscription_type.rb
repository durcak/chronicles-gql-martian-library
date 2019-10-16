# app/graphql/types/subscription_type.rb

module Types
  class SubscriptionType < GraphQL::Schema::Object
    extend GraphQL::Subscriptions::SubscriptionRoot

    field :item_added,
          null: true,
          subscription: Subscriptions::ItemAdded,
          description: "An item was added"

    field :item_updated,
          null: true,
          subscription: Subscriptions::ItemUpdated,
          description: "Existing item was updated"
  end
end
