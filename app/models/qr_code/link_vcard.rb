module QrCode
  class LinkVcard
    def content(person)
      Rails.application.routes.url_helpers.person_url(person, format: :vcf)
    end
  end
end