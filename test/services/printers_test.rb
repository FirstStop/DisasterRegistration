require 'test_helper'
require 'prawn'

class PrintersTest < ActiveSupport::TestCase
    test "Printer Is Availabe" do
        assert(Services::Printers.printer_is_accepting_jobs("Brother_QL_500"))
    end
    test "Printer Is Not Known " do
        assert(! Services::Printers.printer_is_accepting_jobs("Not_Brother_QL_500"))
    end

    test "Print a token to PDF" do
        pdf = Prawn::Document.new(:page_size => "A4")
        pdf.text_box("test test")
        file = Tempfile.new('')
        file.puts(pdf.render.force_encoding('UTF-8'))
        file.close
        assert(Services::Printers.print_token(file, "A4", "CUPS-PDF"))
    end
end
