
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<Map<String, String>> notes = [];

  void addNote({int? index}) {
    final titleController = TextEditingController(
      text: index == null ? '' : notes[index]['title'],
    );

    final descriptionController = TextEditingController(
      text: index == null ? '' : notes[index]['description'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Create New Note' : 'Edit Note'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Note Title',
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    descriptionController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  if (index == null) {
                    notes.add({
                      'title': titleController.text.trim(),
                      'description':
                      descriptionController.text.trim(),
                    });
                  } else {
                    notes[index] = {
                      'title': titleController.text.trim(),
                      'description':
                      descriptionController.text.trim(),
                    };
                  }
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF347A45),
                foregroundColor: Colors.white,
              ),
              child: const Text('Save Note'),
            ),
          ],
        );
      },
    );
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Note deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Notes 📝',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Write down your ideas and save your notes.',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => addNote(),
                icon: const Icon(Icons.add),
                label: const Text('Create New Note'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF347A45),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: notes.isEmpty
                  ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      size: 65,
                      color: Colors.green,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'No Notes Yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Create your first note!'),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF347A45),
                        child: Icon(
                          Icons.note,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        notes[index]['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          notes[index]['description']!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            addNote(index: index);
                          } else if (value == 'delete') {
                            deleteNote(index);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
