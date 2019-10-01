# app/channels/graphql_channel.rb

class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids = []
  end

  def execute(data)
    result = execute_query(data)
    # puts '@@@@@@@@@@@@@@@@@@@@@@@@'
    # puts ensure_hash(data['variables'])
    # puts result.context[:subscription_id]
    # puts '@@@@@@@@@@@@@@@@@@@@@@@@'
    payload = {
      # result: result.subscription? ? { data: nil } : result.to_h,
      result: result.to_h,
      more: result.subscription?
    }
    # binding.pry if result.subscription?
    @subscription_ids << context[:subscription_id] if result.context[:subscription_id]

    # puts "Subscription IDSSssssss:"
    # puts @subscription_ids

    transmit(payload)
  end

  def unsubscribed
    @subscription_ids.each do |sid|
      MartianLibrarySchema.subscriptions.delete_subscription(sid)
    end
  end

  private

  def execute_query(data)
    MartianLibrarySchema.execute(
      query: data["query"],
      context: context,
      variables: ensure_hash(data['variables']),
      operation_name: data["operationName"]
    )
  end

  def context
    {
      current_user_id: current_user&.id,
      current_user: current_user,
      current_user_role: current_user.role,
      channel: self
    }
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
