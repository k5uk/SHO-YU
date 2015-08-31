class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent.subject
  #
  def sent(contact)
    
    @contact = contact

    mail(to: @contact.mail, subject: "お問い合わせありがとうございます<SHO-YU>")
    
  end
  
  def sent_toAdmin(contact)
    
    @contact = contact
    
    mail(to: "songofwheel8@gmail.com", subject: "お問い合わせメールが届いています<SHO-YU>")
  
  end
  
end
