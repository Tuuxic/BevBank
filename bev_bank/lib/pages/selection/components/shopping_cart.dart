import 'package:bev_bank/components/cards/content_card.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class ShoppingCartDataTable extends StatefulWidget {
  const ShoppingCartDataTable({super.key});

  @override
  State<ShoppingCartDataTable> createState() => _ShoppingCartDataTableState();
}

class _ShoppingCartDataTableState extends State<ShoppingCartDataTable> {
  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Text(
          //     "Cart",
          //     style: Theme.of(context).textTheme.headlineLarge,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PlutoGrid(
                columns: [
                  PlutoColumn(
                    title: "Item",
                    field: "item",
                    type: PlutoColumnType.text(),
                  ),
                  PlutoColumn(
                    title: "Price",
                    field: "price",
                    type: PlutoColumnType.number(),
                  ),
                  PlutoColumn(
                    title: "Quantity",
                    field: "quantity",
                    type: PlutoColumnType.number(),
                  ),
                ],
                rows: [
                  PlutoRow(cells: {
                    "item": PlutoCell(value: "Test"),
                    "price": PlutoCell(value: "Test"),
                    "quantity": PlutoCell(value: "Test"),
                  })
                ],
                mode: PlutoGridMode.readOnly,
                columnMenuDelegate: null,
                configuration: PlutoGridConfiguration(
                  columnSize: const PlutoGridColumnSizeConfig(
                    autoSizeMode: PlutoAutoSizeMode.equal,
                    resizeMode: PlutoResizeMode.none,
                  ),
                  style: PlutoGridStyleConfig(
                      activatedBorderColor: Colors.transparent,
                      gridBackgroundColor: Colors.transparent,
                      rowColor: Colors.transparent,
                      iconColor: Theme.of(context).iconTheme.color!,
                      cellTextStyle: Theme.of(context).textTheme.bodyLarge!,
                      columnTextStyle: Theme.of(context).textTheme.titleLarge!,
                      borderColor: Colors.transparent,
                      activatedColor: Colors.transparent,
                      gridBorderColor: Colors.transparent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
