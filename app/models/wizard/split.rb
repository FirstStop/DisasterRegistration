module Wizard
  class Split < Component
    attr_accessor :content
    @@map = {1 => 'one', 2 => 'two', 3 => 'three'}

    def number
      @@map[@content.length]
    end
  end
end