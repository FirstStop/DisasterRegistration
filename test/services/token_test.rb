require 'test_helper'

class TokenTests < ActiveSupport::TestCase
    def setup
        @person = Person.new
        @person.first_name = "Firstname"
        @person.last_name = "Lastname"
        @person.current_contact_email = "FirstnameLastname@CompanyName"
        @person_data = @person.v_card
    end

    test "Can generate QR code" do
        qr_code = Services::Token.qr_code(@person_data, 8)
        assert(qr_code.module_count > 0, "Non zero QR code contents")
    end

    test "Can generate PDF" do
        pdf = Services::Token.generate_token_pdf(@person, 'OC03')
        assert(pdf.page_count == 1, "Non zero PDF  contents")
    end

end
