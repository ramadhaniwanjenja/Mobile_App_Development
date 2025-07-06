import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/notes_provider.dart';
import '../widgets/note_card.dart';
import '../widgets/note_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadNotes();
    });
  }

  Future<void> _loadNotes() async {
    try {
      await Provider.of<NotesProvider>(context, listen: false).fetchNotes();
    } catch (e) {
      _showSnackBar('Failed to load notes: ${e.toString()}', true);
    }
  }

  void _showSnackBar(String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _addNote() async {
    final text = await showDialog<String>(
      context: context,
      builder: (context) => const NoteDialog(),
    );

    if (text != null && text.isNotEmpty) {
      try {
        await Provider.of<NotesProvider>(context, listen: false).addNote(text);
        _showSnackBar('Note added successfully!', false);
      } catch (e) {
        _showSnackBar('Failed to add note: ${e.toString()}', true);
      }
    }
  }

  Future<void> _editNote(String id, String currentText) async {
    final text = await showDialog<String>(
      context: context,
      builder: (context) => NoteDialog(initialText: currentText),
    );

    if (text != null && text.isNotEmpty) {
      try {
        await Provider.of<NotesProvider>(context, listen: false).updateNote(id, text);
        _showSnackBar('Note updated successfully!', false);
      } catch (e) {
        _showSnackBar('Failed to update note: ${e.toString()}', true);
      }
    }
  }

  Future<void> _deleteNote(String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await Provider.of<NotesProvider>(context, listen: false).deleteNote(id);
        _showSnackBar('Note deleted successfully!', false);
      } catch (e) {
        _showSnackBar('Failed to delete note: ${e.toString()}', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notes'),
        actions: [
          IconButton(
            onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          if (notesProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (notesProvider.notes.isEmpty) {
            return const Center(
              child: Text(
                'Nothing here yet—tap ➕ to add a note.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: notesProvider.notes.length,
            itemBuilder: (context, index) {
              final note = notesProvider.notes[index];
              return NoteCard(
                note: note,
                onEdit: () => _editNote(note.id, note.text),
                onDelete: () => _deleteNote(note.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}