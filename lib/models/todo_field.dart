class TodoField {
  final String id;
  final String label;
  final String inputType;

  TodoField({this.id, this.label, this.inputType});

  static List<TodoField> getTodoFormFields() {
    return [
      TodoField(id: 'title', label: 'Title', inputType: 'TEXT'),
      TodoField(id: 'description', label: 'Description', inputType: 'LONG_TEXT')
    ];
  }

  static List<TodoField> getTodoTaskFormFields() {
    return [
      TodoField(id: 'title', label: 'Title', inputType: 'TEXT'),
      TodoField(
          id: 'isCompleted',
          label: 'Is task Completed ?',
          inputType: 'BOOLEAN'),
    ];
  }

  @override
  String toString() {
    return '$label';
  }
}
