require 'rails_helper'

RSpec.describe CsvImporter do
  it 'imports products from a CSV file' do
    file_path = Rails.root.join('spec', 'fixtures', 'inventory.csv')
    CsvImporter.import(file_path)
    expect(Product.count).to be >= 50
  end
end
