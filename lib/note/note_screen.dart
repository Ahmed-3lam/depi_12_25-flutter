import 'package:depi_five/note/note_hive_helper.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  void getNotes() async {
    _isLoading = true;
    setState(() {
      
    });
    await NoteHiveHelper.getAllNote();
    _isLoading = false;
    setState(() {
      
    });
  }

  @override
  void initState() {
  getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note App"),
        actions: [
          TextButton(
            onPressed: () {
              NoteHiveHelper.deleteAllNote();
              setState(() {});
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
                  NoteHiveHelper.addNote(controller.text);
                  setState(() {});
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
      body:_isLoading?Center(child: CircularProgressIndicator(),): ListView.builder(
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
                    NoteHiveHelper.updateNote(controller.text, i);
                    setState(() {});
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
                  NoteHiveHelper.deleteNote(i);
                  setState(() {});
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///(1) Add Note
///(2) Edit Note
///(3) Delete Note
///(4) Delete all notes
///(5) Get all notes

