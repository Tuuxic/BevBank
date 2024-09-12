import 'package:bev_bank/components/cards/beverage_card.dart';
import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SelectionPage extends StatefulWidget {
  final User user;
  const SelectionPage({super.key, required this.user});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  int _totalSpending = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Item"),
        elevation: 1.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 8.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(flex: 1, child: _itemSelectionWidget),
                  Flexible(flex: 1, child: _cartWidget)
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
              child: _balanceWidget,
            ),
          )
        ],
      ),
    );
  }

  Widget get _itemSelectionWidget => ContentCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Items",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: GridView.builder(
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 3,
                    //   mainAxisSpacing: 10,
                    //   crossAxisSpacing: 10,
                    //   mainAxisExtent: 100,
                    //   childAspectRatio: 1.0,
                    // ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                      // mainAxisExtent: 200,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return BeverageCard(
                        name: "Item $index",
                        price: index * 100,
                        onTap: () {},
                      );
                    }),
              ),
            )
          ],
        ),
      );

  Widget get _cartWidget => ContentCard(
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
                        columnTextStyle:
                            Theme.of(context).textTheme.titleLarge!,
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

  Widget get _balanceWidget => ContentCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Total: $_totalSpending"),
                    Text(widget.user.name),
                    Text("Balance: ${widget.user.balance}"),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: const Text("Confirm"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
