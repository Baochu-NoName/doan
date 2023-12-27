json.extract! product, :id, :name, :price, :new_price, :description, :created_at, :updated_at
json.product_url product_url(product)
json.image_url rails_blob_url(product.image)
