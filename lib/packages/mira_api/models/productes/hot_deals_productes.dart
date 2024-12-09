
class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
  });
}


List <Product> hotDealProductes=[
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    price: 199.99,
    description: 'High-quality noise-canceling wireless headphones.',
    imageUrl: 'https://via.placeholder.com/150',
    category: 'Electronics',
  ),
  Product(
    id: 'p2',
    name: 'Running Shoes',
    price: 79.99,
    description: 'Comfortable and durable running shoes.',
    imageUrl: 'https://via.placeholder.com/150',
    category: 'Sportswear',
  ),
  Product(
    id: 'p3',
    name: 'Smart Watch',
    price: 249.99,
    description: 'Feature-rich smartwatch with fitness tracking.',
    imageUrl: 'https://via.placeholder.com/150',
    category: 'Wearables',
  ),
  Product(
    id: 'p4',
    name: 'Backpack',
    price: 49.99,
    description: 'Spacious and stylish backpack for daily use.',
    imageUrl: 'https://via.placeholder.com/150',
    category: 'Accessories',
  ),
  Product(
    id: 'p5',
    name: 'Bluetooth Speaker',
    price: 89.99,
    description: 'Portable Bluetooth speaker with deep bass.',
    imageUrl: 'https://via.placeholder.com/150',
    category: 'Electronics',
  ),
];