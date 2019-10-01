class Subscriptions::ItemAdded < Subscriptions::BaseSubscription
  payload_type Types::ItemType

  argument :id, Integer, required: false

  def subscribe(id: nil)
    puts 'SUBSCRIBEEEEE to ADD@@@'
    # Item.first # test return value on subscribe, works
  end

  def update(id: nil)
    object[:item] # test update, works
  end
end
