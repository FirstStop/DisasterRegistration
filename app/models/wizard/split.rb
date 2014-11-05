module Wizard
  class Split < Component
    attr_accessor :content

    def number
      case @content.length
      when 1
        "one"
      when 2
         "two"
      when 3
        "three"
      else
        "unknown"
      end
    end
  end
end