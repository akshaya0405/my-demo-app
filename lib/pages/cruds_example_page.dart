import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/crud/crud_bloc.dart';
import '../blocs/crud/crud_event.dart';
import '../blocs/crud/crud_state.dart';
import '../models/user.dart';

class CrudExamplePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const CrudExamplePage({Key? key, required this.onToggleTheme})
      : super(key: key);

  @override
  _CrudExamplePageState createState() => _CrudExamplePageState();
}

class _CrudExamplePageState extends State<CrudExamplePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _userIdToUpdate;

  void showForm({User? user, required CrudBloc bloc}) {
    _userIdToUpdate = user?.id;
    _nameController.text = user?.name ?? '';
    _usernameController.text = user?.username ?? '';
    _emailController.text = user?.email ?? '';
    _phoneController.text = user?.phone ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user == null ? "Add User" : "Update User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name")),
              TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: "Username")),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email")),
              TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "Phone")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _usernameController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty) {
                  final userToAddOrUpdate = User(
                    id: _userIdToUpdate,
                    name: _nameController.text,
                    username: _usernameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                  );

                  if (_userIdToUpdate == null) {
                    bloc.add(
                        CreateUser(userToAddOrUpdate)); // Use the passed bloc
                  } else {
                    bloc.add(
                        UpdateUser(userToAddOrUpdate)); // Use the passed bloc
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(user == null ? "Add" : "Update"),
            ),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CrudBloc()..add(LoadUsers()),
      child: Builder(
        builder: (context) {
          // Use a new BuildContext
          return Scaffold(
            appBar: AppBar(title: Text("Firebase CRUD Example")),
            body: BlocBuilder<CrudBloc, CrudState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is UsersLoaded) {
                  final users = state.users;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var user = users[index];
                      return Card(
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              user.name[0].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            user.email,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          trailing: Wrap(
                            spacing: 6,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                tooltip: "Edit User",
                                onPressed: () => showForm(
                                    user: user, bloc: context.read<CrudBloc>()),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                tooltip: "Delete User",
                                onPressed: () => context
                                    .read<CrudBloc>()
                                    .add(DeleteUser(user.id!)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => showForm(bloc: context.read<CrudBloc>()),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
