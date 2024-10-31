import 'package:bev_bank/components/cards/content_card.dart';
import 'package:flutter/material.dart';

class ShoppingCartDataTable extends StatefulWidget {
  final bool isExpanded;

  const ShoppingCartDataTable({super.key, this.isExpanded = true});

  @override
  State<ShoppingCartDataTable> createState() => _ShoppingCartDataTableState();
}

class _ShoppingCartDataTableState extends State<ShoppingCartDataTable> {
  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isExpanded)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox.expand(
                  child: SingleChildScrollView(child: dataTable),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  width: constraints.maxWidth,
                  child: dataTable,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget get dataTable => DataTable(
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'Item',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Price',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Quantity',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: const [
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Test')),
              DataCell(Text('0.85')),
              DataCell(Text('1')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Test')),
              DataCell(Text('0.85')),
              DataCell(Text('1')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Test')),
              DataCell(Text('0.85')),
              DataCell(Text('1')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Test')),
              DataCell(Text('0.85')),
              DataCell(Text('1')),
            ],
          ),
        ],
      );
}
