import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/firestore_service.dart';

class NotesProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _notes = await _firestoreService.fetchNotes();
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String text) async {
    try {
      await _firestoreService.addNote(text);
      await fetchNotes(); // Refresh the list
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateNote(String id, String text) async {
    try {
      await _firestoreService.updateNote(id, text);
      await fetchNotes(); // Refresh the list
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _firestoreService.deleteNote(id);
      await fetchNotes(); // Refresh the list
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}