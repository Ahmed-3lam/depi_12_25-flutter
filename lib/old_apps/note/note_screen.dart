import 'package:depi_five/old_apps/note/cubit/cubit/note_cubit.dart';
import 'package:depi_five/old_apps/note/note_hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
        actions: [
          TextButton(
            onPressed: () {
              cubit.deleteAllNotes();
            },
            child: Text("Clear All"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.clear();
          AlertDialog alert = AlertDialog(
            title: Text("Add Note"),
            content: TextField(controller: controller),
            actions: [
              TextButton(
                onPressed: () {
                  cubit.addNote(controller.text);
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          );

          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: NoteHiveHelper.notes.length,
            itemBuilder: (c, i) => InkWell(
              onTap: () async {
                controller.text = NoteHiveHelper.notes[i];
                AlertDialog alert = AlertDialog(
                  title: Text("Update Note"),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      onPressed: () {
                        cubit.updateNote(text: controller.text, i: i);
                        Navigator.pop(context);
                      },
                      child: Text("Update"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                );

                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: i == 0
                          ? Colors.blue.withValues(alpha: .2)
                          : i % 2 == 0
                          ? Colors.red.withValues(alpha: .2)
                          : Colors.green.withValues(alpha: .2),
                    ),
                    child: Center(
                      child: Text(
                        NoteHiveHelper.notes[i],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.deleteNote(i);
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


///(1) Add Note
///(2) Edit Note
///(3) Delete Note
///(4) Delete all notes
///(5) Get all notes

