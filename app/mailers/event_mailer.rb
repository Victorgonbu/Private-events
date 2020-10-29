class EventMailer < ApplicationMailer
  def event_created
    @event = params[:event]
    @url = 'example.com'
    mail(to: @event.creator.email, subject: 'New private event created')
  end
end
