module Wizard
  class Input < Component
    attr_accessor :id, :text, :placeholder, :type, :additional_container_class

    def initialize(params)
      super
      @type = 'text' unless @type
    end
  end
end