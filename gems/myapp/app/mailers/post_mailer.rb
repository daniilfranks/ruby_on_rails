class PostMailer < ApplicationMailer
  default from: 'info@damilababaov.ovh'

  def welcome_email(post)
    @post = post
    mail(to: 'babanovs5@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
