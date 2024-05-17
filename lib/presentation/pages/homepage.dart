import 'dart:math';
import 'package:expense_tracker/core/controller/text_controller.dart';
import 'package:expense_tracker/presentation/providers/expense_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorycontroller = TextEditingController();
    final amountcontroller = DoubleEditingController();
    final DateTime today = DateTime.now();

    void add() {
      ref
          .read(expenseProvider.notifier)
          .addExpenses(categorycontroller.text, amountcontroller.text, today);
    }

    final provider = ref.watch(expenseProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                final day = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(const Duration(days: 3)),
                  lastDate: DateTime.now(),
                );
                print(day);
                // showModalBottomSheet(
                //   useSafeArea: true,
                //   scrollControlDisabledMaxHeightRatio:
                //       CupertinoContextMenu.animationOpensAt,
                //   context: context,
                //   builder: (context) {
                //     return TableCalendar(
                //         locale: "en_US",
                //         rowHeight: 43,
                //         headerStyle: const HeaderStyle(
                //             formatButtonVisible: false, titleCentered: true),
                //         pageAnimationEnabled: true,
                //         onDaySelected: (selectedDay, focusedDay) {
                //           // _onDaySelected(selectedDay, focusedDay);
                //           Navigator.pop(context);
                //         },
                //         selectedDayPredicate: (day) => isSameDay(day, today),
                //         availableGestures: AvailableGestures.all,
                //         focusedDay: today,
                //         firstDay: DateTime.utc(2023, 10, 1),
                //         lastDay: DateTime.utc(2026, 09, 31));
                //   },
                // );
              },
              icon: const Icon(Icons.calendar_month_outlined)),
          backgroundColor: Colors.amberAccent,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Expense Track',
            ),
            Tab(
              text: 'Income Track',
            )
          ]),
        ),
        body: TabBarView(children: [
          Center(
              child: ListView.builder(
            itemCount: provider.value?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.attach_money),
                  ),
                  title: Text("${provider.value?[index].amount}"),
                  subtitle: Text(provider.value?[index].category ??
                      "Something went wrong"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            ref.read(expenseProvider.notifier).deleteExpense(
                                context,
                                id: provider.value![index].id);
                            ref.invalidate(expenseProvider);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },
          )),
          Center(
              child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.money),
                  ),
                  title: Text('income ${index + 1}'),
                  subtitle: const Text("All Incomes here"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            log(provider.value![index].id);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },
          )),
        ]),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Categories', icon: Icon(Icons.category))
        ]),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Expenses"),
                    content: TextField(
                      controller: amountcontroller,
                      decoration: InputDecoration(
                          label: const Text("Enter a Amount"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    actions: [
                      TextField(
                        controller: categorycontroller,
                        decoration: InputDecoration(
                            label: const Text("Spent For?"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          FilledButton(
                              onPressed: () {
                                add();
                                ref.invalidate(expenseProvider);
                                Navigator.pop(context);
                              },
                              child: const Text("Add Expenses"))
                        ],
                      )
                    ],
                  );
                },
              );
            },
            label: const Icon(Icons.add)),
      ),
    );
  }
}
