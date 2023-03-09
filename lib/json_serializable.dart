mixin JsonSerializable {
  void fromJSON(dynamic json);

  dynamic toJSON({List<JsonSerializable> serialized});
}
