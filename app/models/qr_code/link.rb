module QrCode
  class Link
    def content(person)
      Rails.application.routes.url_helpers.person_url(person)
    end
  end
end