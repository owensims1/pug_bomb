class Mailer < ApplicationMailer
  def pug_bomb(email, pug)
    @pug = pug
    mail(to: email, subject: "Hi there")
  end
end
