class AddressModel {
  String addressTitle;
  String addressDetails;
  String addressImage;

  AddressModel({
    required this.addressTitle,
    required this.addressDetails,
    required this.addressImage,
  });

  factory AddressModel.fromJson(dynamic map) {
    return AddressModel(
        addressTitle: map["addressTitle"],
        addressDetails: map["addressDetails"],
        addressImage: map["addressImage"]);
  }
}
