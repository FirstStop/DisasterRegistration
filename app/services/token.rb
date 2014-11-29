require 'rqrcode_png'
require 'stringio'
require 'prawn'
require 'prawn/measurement_extensions'

module Services
    class Token
        
    def self.qr_code(person, size)
        data = Rails.configuration.qr_code_generator.content(person)
        begin
                img = RQRCode::QRCode.new( data, :size => size, :level => :l)
            Rails.logger.info "created qr code, user=#{person.id}, size=#{size}, content=#{data}"
            return img
        rescue
            size += 1
            retry unless size > 40
        end
    
    end
    
    def self.generate_token_pdf(person, media)

        media_parameters = {
            'DC03' =>  { :width => 90, :height =>29, :leftMargin => 2, :rightMargin => 5 , :spacing => 3 },
            'DC04' =>  { :width => 90, :height =>38, :leftMargin => 1, :rightMargin => 5 , :spacing => 3 },
           'A4' =>  { :width => 90, :height =>29, :leftMargin => 2, :rightMargin => 3 , :spacing => 3 } }
        
        parameters = media_parameters[media]
        Rails.logger.info "Generating token for #{person.id} #{media}"
        width = parameters[:width].send(:mm)
        height = parameters[:height].send(:mm)
        leftMargin = parameters[:leftMargin].send(:mm)
        rightMargin = parameters[:rightMargin].send(:mm)
        spacing = parameters[:spacing].send(:mm)

        pdf = Prawn::Document.new(:page_size => [height, width],
                                  :page_layout => :landscape,
                                  :margin => 0
                                  )
                                  
        pdf.font_size = 18
        # width of paper less width of QR code less left margin less right margin less spacing
        textWidth = width - height - leftMargin - spacing - rightMargin
        # Layout is name and email on left and QR code on right with RHoK event name at bottom
        pdf.text_box "#{person.nickname}", :at => [ leftMargin + height + spacing, height -  spacing] , :width => textWidth, :height => 20, :overflow => :shrink_to_fit
        pdf.text_box "#{person.speciality}", :at => [leftMargin + height + spacing, height - 20  - spacing], :width => textWidth, :height => 18, :overflow => :shrink_to_fit

# pdf.text_box "#{person.super_power}", :at => [leftMargin + height + spacing, height - 20  - 16 - spacing - spacing], :width => textWidth, :height => 16, :overflow => :shrink_to_fit
        pdf.text_box "RHoK Sydney November 2014", :at => [leftMargin + height + spacing, spacing], :size => 6
        pdf.image StringIO.new(self.qr_code(person, 8).to_img.resize(300, 300).to_blob), :at => [leftMargin, height], :fit => [height, height]
        return pdf
    end
    
end
    
end
