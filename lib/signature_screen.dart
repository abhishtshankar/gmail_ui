import 'package:flutter/material.dart';

class SignatureScreen extends StatefulWidget {
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  List<String> signatureNames = ["Signatures :"];

  void _showAddSignatureDialog() {
    String newName = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Signature"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newName = value;
                },
                decoration: InputDecoration(labelText: "Signature Name"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (newName.isNotEmpty) {
                    signatureNames.add(newName);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  void _showEditDeleteDialog(int index) {
    String editedName = signatureNames[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit or Delete Signature"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Edit or delete the signature:"),
              Text(
                signatureNames[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _editSignature(index);
              },
              child: Text("Edit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteSignature(index);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _editSignature(int index) {
    String editedName = signatureNames[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedName = editedName;

        return AlertDialog(
          title: Text("Edit Signature"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  updatedName = value;
                },
                controller: TextEditingController(text: editedName),
                decoration: InputDecoration(labelText: "New Signature Name"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  signatureNames[index] = updatedName;
                });
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _deleteSignature(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Signature"),
          content: Text("Are you sure you want to delete this signature?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  signatureNames.removeAt(index);
                });
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: signatureNames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          signatureNames[index],
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showEditDeleteDialog(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _showEditDeleteDialog(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showAddSignatureDialog,
                  child: Text("Add Signature"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
