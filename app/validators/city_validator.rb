class CityValidator < ActiveModel::EachValidator
  def validate(record)
    city = record.city.split

    if city.any?{|w| w[0].upcase != w[0]}
      make_city_titlecase(record)
      # record.errors[:city] << "City must be in title case"
    elsif city.include?(/[^A-Za-z\s\-\'\.]+/)
      record.errors[:city] << "City cannot contain numbers or some special characters"
    end
  end

  def make_city_titlecase(record)
    record.city = record.city.titlecase
  end
end