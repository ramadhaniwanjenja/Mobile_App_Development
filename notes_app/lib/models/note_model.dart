// This file defines the Note model used in the application.
class Note {
  final String id;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  Note({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromFirestore(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      text: data['text'] ?? '',
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}