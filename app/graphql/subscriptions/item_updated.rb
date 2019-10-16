class Subscriptions::ItemUpdated < Subscriptions::BaseSubscription
  payload_type Types::ItemType

  argument :id, Integer, required: false
end
