import 'package:flutter/material.dart';
import 'package:parking/features/list/domain/entities/parking_block.dart';

class CustomListView extends StatelessWidget {
  final List<ParkingBlock> list;
  const CustomListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    Color getColor(bool status) {
      return status ? Colors.red : Colors.green;
    }

    Widget getText(bool status) {
      String text = status ? 'Ocupada' : 'Desocupada';
      return Text(
        text,
        style: TextStyle(color: getColor(status)),
      );
    }

    List<Widget> getTile(ParkingBlock parkingBlock) {
      return parkingBlock.spaces!.entries
          .map((entry) => ListTile(
              title: Text('${parkingBlock.id}${entry.key}',
                  style: TextStyle(color: getColor(entry.value))),
              subtitle: getText(entry.value)))
          .toList();
    }

    int unoccupiedCounter(Map map) {
      int unoccupied = 0;
      map.forEach((key, value) {
        if (!value) {
          unoccupied++;
        }
      });
      return unoccupied;
    }

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return ExpansionTile(
              title: Text('Bloco  ${list[i].id}'),
              subtitle: Text(
                  '${unoccupiedCounter(list[i].spaces!)} vagas desocupadas'),
              children: getTile(list[i]));
        });
  }
}
