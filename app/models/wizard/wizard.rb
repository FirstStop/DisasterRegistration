module Wizard
  class Wizard < Component
    many :content, class: Wizard::WizardNode
  end
end