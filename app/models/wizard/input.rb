module Wizard
  class Input < Component
    key :attribute, String
    key :label, String
    key :placeholder, String
    key :type, String
    key :additional_container_class, String

    def initialize(params)
      super
      @type = 'text' unless @type
    end
  end
end