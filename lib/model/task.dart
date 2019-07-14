class Task {
  final String content;
  final String category;
  DateTime createdTime;
  DateTime updateTime;

  bool finished;

  Task({
    this.content = 'Upload first shot on Dribble',
    this.category = 'Design stuff',
    this.finished = false
  }) {
    this.createdTime = DateTime.now();
    this.updateTime = this.createdTime;
  }

}