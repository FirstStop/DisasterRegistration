require 'rqrcode_png'
require 'stringio'
require 'prawn'
require 'prawn/measurement_extensions'

module Services
  class Token

    def self.qr_code(person, size)
      data = Rails.configuration.qr_code_generator.content(person)
      begin
        img = RQRCode::QRCode.new(data, :size => size, :level => :l)
        Rails.logger.info "created qr code, user=#{person.id}, size=#{size}, content=#{data}"
        return img
      rescue
        size += 1
        retry unless size > 40
      end
    end

    def self.generate_token_pdf(person, media)
      media_parameters = {
        'DC03' => { :width => 90, :height => 29, :leftMargin => 2, :rightMargin => 5 , :spacing => 3 },
        'DC04' => { :width => 90, :height => 38, :leftMargin => 1, :rightMargin => 5 , :spacing => 3 },
        'A4'   => { :width => 90, :height => 29, :leftMargin => 2, :rightMargin => 3 , :spacing => 3 }
      }

      parameters = media_parameters[media]
      Rails.logger.info "Generating token for #{person.id} #{media}"

      width = parameters[:width].send(:mm)
      height = parameters[:height].send(:mm)

      leftMargin = parameters[:leftMargin].send(:mm)
      rightMargin = parameters[:rightMargin].send(:mm)
      spacing = parameters[:spacing].send(:mm)

      pdf = Prawn::Document.new(
        :page_size => [height, width],
        :page_layout => :landscape,
        :margin => 0
      )

      pdf.font_size = 18
      # width of paper less width of QR code less left margin less right margin less spacing
      text_left = leftMargin + height
      text_width = width - text_left - rightMargin

      # Layout is QR code on left and nickname, intended_role, speciality just right of that, with RHoK event name at bottom
      labels = {
        nickname: 20,
        intended_role: 10,
        speciality: 16
      }
      event_label = 'RHoK Melbourne, December 2014'

      line_offset = 0
      labels.each do |person_attribute, line_height|
        pdf.text_box(
          person[person_attribute],
          :at => [
            text_left,
            height - spacing - line_offset
          ],
          :width => text_width,
          :height => line_height,
          :overflow => :shrink_to_fit
        )
        line_offset += line_height + 2
      end

      pdf.text_box(event_label, :at => [ text_left, spacing + 2 ], :size => 7)
      pdf.image(StringIO.new(self.qr_code(person, 8).to_img.resize(300, 300).to_blob), :at => [leftMargin, height], :fit => [height, height])

      return pdf
    end

  end
end
