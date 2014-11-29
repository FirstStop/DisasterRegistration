Rails.application.configure do
  config.qr_code_generator = QrCode::Vcard.new
  config.token_media = 'DC04'
end