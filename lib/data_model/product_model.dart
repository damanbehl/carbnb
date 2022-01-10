class ProductModel {
  final String brand;
  final String name;
  final List<String> imagesArray;
  final String description;
  final String mainImage;
  final String priceNumerical;
  final String priceTagLine;
  final String selfId;
  final String type;

  ProductModel(
      this.brand,
      this.name,
      this.imagesArray,
      this.description,
      this.mainImage,
      this.priceNumerical,
      this.priceTagLine,
      this.selfId,
      this.type);
}
