ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => [KEY_ID],
  :secret_access_key => [ACCESS_KEY],
  :server => 'email.eu-west-1.amazonaws.com'