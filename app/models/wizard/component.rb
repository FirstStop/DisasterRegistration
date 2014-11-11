module Wizard
  class Component
    include ActiveModel::Model

    def template_name
      "wizard/components/#{self.class.name.demodulize.to_s.downcase}"
    end
  end
end