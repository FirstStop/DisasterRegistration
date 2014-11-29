module Wizard
  class Buttons < Component
    many :content, class: Component
  end
end