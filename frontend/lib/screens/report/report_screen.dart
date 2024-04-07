import 'package:flutter/material.dart';
import 'package:frontend/database/position_db.dart';
import 'package:frontend/models/position.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Future<List<Position>>? futurePosition;
  final positionDB = PositionDB();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosition();
  }

  void fetchPosition() async {
    setState(() {
      futurePosition = positionDB.getPositions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Position>>(
        future: futurePosition,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].label);
              }
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
