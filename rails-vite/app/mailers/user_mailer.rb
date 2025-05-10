# class UserMailer < Devise::Mailer
#   helper :application
#   include Devise::Controllers::UrlHelpers
#   default from: "vu.nguyen1.tms@gmail.com"


#   def verify_email
#     @user = params[:user]
#     @url = 'http://127.0.0.1:3000/users/sign_in'
#     mail(to: @user.email, subject: "Verify your email address")
#   end
# end
