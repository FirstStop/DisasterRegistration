module Workbench
  class Workbench
    include ActiveModel::Model
    include MongoMapper::EmbeddedDocument

    key :table_attributes, Hash

    key :status_attribute, String
    key :statuses, Hash
  end
end