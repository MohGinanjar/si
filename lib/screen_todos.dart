import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si/controllers/todo_controller.dart';
import 'package:si/models/todo.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoC = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder(
        builder: (TodoController todocontroller) {
          return ListView.builder(
              itemCount: todoC.todos!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: todoC.todos![index].isCompleted,
                    onChanged: (value) {
                      todocontroller.changeStatus(todoC.todos![index]);
                    },
                  ),
                  title: Text("${todocontroller.todos![index].description}"),
                  onTap: () {
                    Get.bottomSheet(Container(
                      height: 500,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: todoC.todosvalue,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Add Todo',
                                hintText: 'Todo',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      todoC.updatedTodo(
                                          Todo(description:todoC.todos![index].description),
                                          todoC.todosvalue.text);

                                      Get.back();
                                    },
                                    child: Text(
                                      "UPDATE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ));
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todoC.addTodo(Todo(description: "Helloworld"));
          Get.bottomSheet(
            Container(
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Tenggiri", "Tongkol", "Tuna Merah", "Kakap", "Kerapu","Kuwe"],
              label: "Jenis Ikan",
              hint: "Silahkan Pilih Jenis Ikan",
             showSearchBox: true,
             onChanged: print,
              selectedItem: "Tenggiri"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Kg", "Bakul", "Tampa",],
              label: "Satuan",
              hint: "Silahkan Pilih Satuan",
             showSearchBox: true,
             onChanged: print,
              selectedItem: "Kg"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: todoC.todosvalue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Jumlah',
                      hintText: 'Jumlah',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: todoC.todosvalue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Harga Satuan',
                      hintText: 'Harga Satuan',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: todoC.todosvalue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sub Total',
                      hintText: 'Sub Total',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            todoC.addTodo(
                                Todo());
                            Get.back();
                          },
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ))),
                ),
              ],
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
