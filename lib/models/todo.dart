class Todo {
  String id, title, description;

  Todo({
    this.id,
    this.title,
    this.description,
  });

  @override
  String toString() {
    return 'id $id title $title description $description';
  }
}
