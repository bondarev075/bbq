class EventMailer < ApplicationMailer

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий в событии @ #{event.title}"
  end

  def photo(event, photo, email)
    @photo = photo
    @event = event

    path = photo.photo.thumb
    path = "#{Rails.root}/public#{path}" unless Rails.env.production?
    attachments.inline[photo.photo.file.filename] = File.read(path)
    mail to: email, subject: "Новая фотография в событии @ #{event.title}"
  end
end
