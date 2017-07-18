class ApplicationMailer < ActionMailer::Base
  default from: 'qa@example.com'
  layout 'mailer'

  def send_message(mail_address)
    attachments['qa.pdf'] = File.read('qa.pdf')
    mail(to: mail_address, subject: 'Your questions')
  end
end
