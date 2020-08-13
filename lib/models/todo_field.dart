class TodoField {
  final String id;
  final String label;
  final String inputType;

  TodoField({this.id,this.label, this.inputType});

  @override
  String toString() {
    return '$label';
  }
}
