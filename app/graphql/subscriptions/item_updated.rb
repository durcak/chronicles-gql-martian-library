class Subscriptions::ItemUpdated < Subscriptions::BaseSubscription
  payload_type Types::ItemType

  argument :id, String,
           required: false

  def subscribe(id: nil)
    # binding.pry
  end

  def update(id: nil)
    # binding.pry
    # object.update!(title: 'blank')
    object
  end
end
