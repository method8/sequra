if Merchant.count == 0
  path = File.join(File.dirname(__FILE__), "/seeds/merchants.json")
  records = JSON.parse(File.read(path))['RECORDS']
  records.each do |record|
    Merchant.create({
       id: record['id'],
       name: record['name'],
       email: record['email'],
       cif: record['cif']
     })
  end
  puts "merchants are seeded"
end

if Order.count == 0
  path = File.join(File.dirname(__FILE__), "/seeds/orders.json")
  records = JSON.parse(File.read(path))['RECORDS']
  records.each do |record|
    Order.create({
      id: record['id'],
      merchant_id: record['merchant_id'],
      shopper_id: record['shopper_id'],
      amount: record['amount'],
      created_at: record['created_at'],
      completed_at: record['completed_at'],
      paid: false
     })
  end
  puts "orders are seeded"
end

if Shopper.count == 0
  path = File.join(File.dirname(__FILE__), "/seeds/shoppers.json")
  records = JSON.parse(File.read(path))['RECORDS']
  records.each do |record|
    Shopper.create({
      id: record['id'],
      name: record['name'],
      email: record['email'],
      nif: record['nif']
    })
  end
  puts "shoppers are seeded"
end