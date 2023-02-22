class TodoModel {
  String task;
  String created_by;
  List<String> remarks;
  int id;
  bool done;
  DateTime expireDate;
  DateTime? created_at;
  DateTime? updated_at;
  TodoModel({
    required this.expireDate,
    required this.task,
    required this.created_by,
    required this.remarks,
    required this.id,
    this.done = false,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    this.created_at = created_at ?? DateTime.now();
    this.created_at = updated_at ?? DateTime.now();
  }

  factory TodoModel.fromJson(Map<String, dynamic> data) {
    return TodoModel(
        id: data['id'],
        expireDate: data['expireDate'],
        task: data['task'],
        done: data['done'],
        remarks: data['remarks'],
        created_by: data['created_by'],
        created_at: DateTime.fromMicrosecondsSinceEpoch(data["created_at"]),
        updated_at: DateTime.parse(data['updated at']));
  }
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "task": task,
      "remarks": remarks,
      "created_at": created_at!.millisecondsSinceEpoch, //converetd into int
      "created_by": created_by,
      "updated_at": updated_at!.toIso8601String(), //converted into string
      "done": done,
      "expireDate": expireDate
    };
  }
}
