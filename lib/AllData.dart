

class DetailsOfUser{
  final String serImage;
  final String brandName;
  final String productTitle;
  final String productDescription;
  final String productImage;
  final int price;

  const DetailsOfUser({
    required this.brandName,
    required this.serImage,
    required this.productTitle,
    required this.productDescription,
    required this.productImage,
    required this.price,
  });

  static const List<DetailsOfUser>BrandProduct = [
    DetailsOfUser(
    brandName: "Brand1",
    serImage: "images/product/Shirt.jpg",
    productTitle: "Mobile Phone",
    productDescription: "1) Good brand\n\n"
        "2) Android 11with One UI 3.1 (Upgradeable Android version and UI version)\n\n"
        "3) Speaker sound quality\n\n"
        "4) 5000 mAH battery\n\n"
        "5) Durability\n\n"
        "6) 4gb RAM 64 GB ROM\n\n"
        "7) Clean UI",
    productImage: "images/products/Phone.png",
    price: 12000 ),
    DetailsOfUser(
    brandName: "Brand2",
    serImage: "images/Category/electronic-devices.jpg",
    productTitle: "Watch",
    productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
    productImage: "images/products/Watch.jpg",
    price: 1500),
    DetailsOfUser(
        brandName: "Brand3",
        serImage: "images/Category/food.jpeg",
        productTitle: "Mouse",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/mouse.png",
        price: 300),
    DetailsOfUser(
        brandName: "Brand4",
        serImage: "images/Category/Furniture.jpeg",
        productTitle: "Hoddie",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/hoddie.png",
        price: 450),
    DetailsOfUser(
        brandName: "Brand5",
        serImage: "images/Category/Gamingproduct.jpeg",
        productTitle: "Laddies Heel",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/Heel.jpg",
        price: 900),
    DetailsOfUser(
        brandName: "Brand6",
        serImage: "images/Category/Home-equipment.jpg",
        productTitle: "Earphone",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/Earphone.jpg",
        price: 600),
    DetailsOfUser(
        brandName: "Brand7",
        serImage: "images/Category/kitchenaccessories.jpg",
        productTitle: "Caps",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/caps.png",
        price: 200),
    DetailsOfUser(
        brandName: "Brand8",
        serImage: "images/Category/shoes.jpg",
        productTitle: "Laddies Bag",
        productDescription: "Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.Here is the mouse description.",
        productImage: "images/products/bag.png",
        price: 800),
  ];

}


