class InputFieldOption {
  String name;
  dynamic code;

  InputFieldOption({
    required this.code,
    required this.name,
  });

  @override
  String toString() => '$name $code';
}
