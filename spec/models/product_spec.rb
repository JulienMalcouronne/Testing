require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


RSpec.describe Product, type: :model do
    before do
      @invalid_product = Product.new(title: '', description: '', price: '')
      @valid_product = Product.new(title: 'One', description: 'description one', price: '100.00')
      @invalid_price = Product.new(title: 'One', description: 'description one', price: '0.00')
    end

    describe 'title' do
      it 'validates presence of title' do
        product = @invalid_product
        product.valid?
        expect(product.errors[:title]).to include("can't be blank")
      end

    it 'validates uniqueness of a title' do
      @valid_product.save
      new_product = @valid_product.dup
      new_product.valid?
      expect(new_product.errors[:title]).to include('has already been taken')
    end
  end
  describe 'price' do
    it 'validates a price higher than 0' do
      @invalid_price.save
      last_product = @invalid_price
      last_product.valid?
      expect(last_product.errors[:price]).to include('price must be higher than 0')
    end
  end
end
