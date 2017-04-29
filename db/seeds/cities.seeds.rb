fnames = Dir[Rails.root.join("db/seeds/json/*.json")]

fnames.each do |fname|
  cities = JSON.load File.new(fname)
  cities.each do |city|
    City.where(name: city['name'], region: city['division_main'][0,10]).first_or_initialize.update(
      name: city['name'][0,50], \
      postal_code: city['postal_code'], \
      department: city['division_id'][0,2], \
      region: city['division_main'][0,10], \
      country_code: city['country_code'][0,2], \
      lat: city['latitude'], \
      lon: city['longitude'], \
      distance: 1)
  end
end
