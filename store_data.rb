require 'json'

class StoreData
  def store_data_in_file(name_of_file, data)
    file = File.write(name_of_file, JSON.generate(data), mode:"w")
  end
end