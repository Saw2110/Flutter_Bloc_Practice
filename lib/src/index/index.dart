import 'package:firstapp_bloc/blocs/user_bloc/user_bloc.dart';
import 'package:firstapp_bloc/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    userBloc.add(GetUserList());
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        child: BlocProvider(
          create: (context) => userBloc,
          child: BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return _buildLoading();
                } else if (state is UserLoading) {
                  return _buildLoading();
                } else if (state is UserLoaded) {
                  return _buildCard(context, state.userModel);
                } else if (state is UserError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, UserModel model) {
    return ListView.builder(
      itemCount: model.data!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("First Name: ${model.data![index].firstName}"),
                  Text("Last Name: ${model.data![index].lastName}"),
                  Text("Email: ${model.data![index].email}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
