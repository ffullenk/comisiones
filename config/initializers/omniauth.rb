Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, 'W1AlZmNK4UnLhsg1N5XaRw', 'Eqi76j0vwr0O6SX5DxMnC0wmG0404ol44Cx2u6fM'
  provider :facebook, '183752981763205', 'c7b4bb848e922ea92eccb9b4b596170b',
           :scope => 'email,read_stream, publish_stream', :display => 'popup'
end