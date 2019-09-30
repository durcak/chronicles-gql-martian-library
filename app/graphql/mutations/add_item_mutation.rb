# app/graphql/mutations/add_item_mutation.rb

module Mutations
  class AddItemMutation < Mutations::BaseMutation
    argument :attributes, Types::ItemAttributes, required: true # new argument

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true # <= change here

    # signature change
    def resolve(attributes:)
      check_authentication!

      item = Item.new(attributes.to_h.merge(user: context[:current_user])) # change here

      if item.save
        if attributes[:role].present?
          MartianLibrarySchema.subscriptions.trigger("itemAdded", {}, item, scope: attributes[:role])
        else
          Role.constants.each{ |role| MartianLibrarySchema.subscriptions.trigger("itemAdded", {}, item, scope: role.to_s) }
        end

        { item: item }
      else
        { errors: item.errors }
      end
    end
  end
end
