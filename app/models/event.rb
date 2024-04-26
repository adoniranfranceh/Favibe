class Event < ApplicationRecord
  enum status: { hidden: 0, published: 1 }

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.
           i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
