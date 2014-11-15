Rails.application.configure do
  config.qr_code_generator = QrCode::LinkVcard.new
end