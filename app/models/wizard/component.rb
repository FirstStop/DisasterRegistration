module Wizard
  class Component
    include ActiveModel::Model
    include MongoMapper::EmbeddedDocument

    def template_name
      "wizard/components/#{self.class.name.demodulize.to_s.downcase}"
    end

    def get_value(person)
      person.try :[], attribute.to_sym
    end
  end
end