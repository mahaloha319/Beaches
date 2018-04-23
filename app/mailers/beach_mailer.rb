class BeachMailer < ApplicationMailer
  def beach_mail(user)
   @user = user

   mail to: @user.email, subject: "アカウント登録完了メール"
  end
end
