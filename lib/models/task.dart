class Task {
  int? id;
  int? color;
  int? remind;
  int? isCompleted;
  String? title;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.color,
    this.date,
    this.endTime,
    this.isCompleted,
    this.note,
    this.remind,
    this.repeat,
    this.startTime,
  });
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    date = json['date'];
    endTime = json['endTime'];
    isCompleted = json['isCompleted'];
    note = json['note'];
    remind = json['remind'];
    repeat = json['repeat'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['color'] = color;
    data['remind'] = remind;
    data['repeat'] = repeat;

    return data;
  }
}
