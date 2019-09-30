# app/graphql/mutations/update_item_mutation.rb

module Mutations
  class UpdateItemMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :attributes, Types::ItemAttributes, required: true # new argument

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true # <= change here

    def resolve(id:, attributes:)
      check_authentication!

      item = Item.find(id)

      if item.update(attributes.to_h)
        if item.role.present?
          MartianLibrarySchema.subscriptions.trigger("itemAdded", {}, item, scope: item.role)
        else
          Role.constants.each{ |role| MartianLibrarySchema.subscriptions.trigger("itemAdded", {}, item, scope: role.to_s) }
        end

        MartianLibrarySchema.subscriptions.trigger("itemUpdated", {}, {nice: true})
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
