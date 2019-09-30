# app/models/item.rb

class Item < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, length: { minimum: 5 }, allow_blank: true
end
