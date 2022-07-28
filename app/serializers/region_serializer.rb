class RegionSerializer < ActiveModel::Serializer
  attributes :code, :name, :region_name, :count_of_cities

  def code
    object.code
  end

  def name
    object.name
  end

  def count_of_provinces
    object.provinces.count
  end
end
