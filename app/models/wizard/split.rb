module Wizard
  class Split < Component
    many :content, class: Component

    @@map = {1 => 'one', 2 => 'two', 3 => 'three'}

    def number
      @@map[content.length]
    end
  end
end