Rails.application.configure do
  config.qr_code_generator = QRCode::VCard.new
end