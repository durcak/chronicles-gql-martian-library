class Subscriptions::ItemAdded < Subscriptions::BaseSubscription
  payload_type Types::ItemType

  argument :test_id, Integer, required: false

end
