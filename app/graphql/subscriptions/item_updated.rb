class Subscriptions::ItemUpdated < Subscriptions::BaseSubscription
  payload_type Types::ItemType

  argument :id, Integer, required: false

  def subscribe(id: nil)
    puts 'SUBSCRIBEEEEE to UPDATE@@@'
    # Item.first # test return value on subscribe, works
  end

  def update(id: nil)
    # object.update!(title: 'blank')
    object
  end
end
