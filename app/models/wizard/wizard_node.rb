module Wizard
  class WizardNode < Component
    key :name, String
    many :content, class: Component
  end
end