class CityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && value =~ /\A[A-Za-z\s\-\'\.]+\z/
      record.errors[attribute] << (options[:message] || "can't contain numbers or special characters")
    end
  end
end