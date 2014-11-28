Rails.application.configure do
  config.qr_code_generator = QrCode::LinkVcard.new
  config.token_media = 'DC04'
end