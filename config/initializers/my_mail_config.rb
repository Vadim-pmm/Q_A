ActionMailer::Base.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'example.com',
      authentication: 'plain',
      enable_starttls_auto: true,
      user_name: '',
      password: ''
}
