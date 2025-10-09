class CartUpdateParams {
  final int? cartItemId;
  final int quantity;

  CartUpdateParams({required this.cartItemId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {"cart_item_id": cartItemId, "quantity": quantity};
  }
}
