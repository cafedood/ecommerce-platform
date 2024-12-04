require 'csv'

class CsvImporter
  def self.import(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      Product.create!(
        name: row['NAME'],
        category: row['CATEGORY'],
        quantity: row['QTY'].to_i,
        price: row['DEFAULT_PRICE'].to_f,
        dynamic_price: 0
      )
    end
  end
end
