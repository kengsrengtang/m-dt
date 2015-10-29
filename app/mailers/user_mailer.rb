class UserMailer < ApplicationMailer
  default from: 'kengsrengkh@gmail.com'

  def welcome(reservation)
    @reservation =reservation
    @url = ""
    mail(to: @reservation.email, subject: 'wellcome mdt')
  end
end
