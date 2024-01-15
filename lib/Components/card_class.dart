class CardModel {
  final String image;
  final double rate;

  CardModel({required this.image, required this.rate});
}

List<CardModel> cardList = [

  CardModel(image: "assets/images/card_images/image1.jpeg", rate: 10),
  CardModel(image: "assets/images/card_images/image2.jpeg", rate: 9),
  CardModel(image: "assets/images/card_images/image3.jpeg", rate: 10),
  CardModel(image: "", rate: 10),
  CardModel(image: "", rate: 10),
  CardModel(image: "", rate: 10),
  CardModel(image: "", rate: 10),
];