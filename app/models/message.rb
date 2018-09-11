class Message < ApplicationRecord
    after_commit :create_message_notification, on: :create

  def create_message_notification
        Pusher.trigger('dashboard', 'create', self.as_json) #(channer_name, event_name, data)
  end
end
