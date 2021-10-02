import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'model.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<FoodListModel> dataList = [
    FoodListModel(
        name: 'ร้านที่ 1',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu a', price: 100),
          MenuModel(name: 'menu b', price: 200),
          MenuModel(name: 'menu c', price: 300),
          MenuModel(name: 'menu d', price: 400),
        ],
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    FoodListModel(
        name: 'ร้านที่ 2',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu a', price: 100),
          MenuModel(name: 'menu s', price: 200),
          MenuModel(name: 'menu d', price: 300),
          MenuModel(name: 'menu f', price: 400),
        ],
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'),
    FoodListModel(
        name: 'ร้านที่ 3',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu z', price: 100),
          MenuModel(name: 'menu x', price: 200),
          MenuModel(name: 'menu c', price: 300),
          MenuModel(name: 'menu v', price: 400),
        ],
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    FoodListModel(
        name: 'ร้านที่ 4',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu q', price: 100),
          MenuModel(name: 'menu e', price: 200),
          MenuModel(name: 'menu j', price: 300),
          MenuModel(name: 'menu v', price: 400),
        ],
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    FoodListModel(
        name: 'ร้านที่ 4',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu a', price: 100),
          MenuModel(name: 'menu b', price: 200),
        ],
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    FoodListModel(
        name: 'ร้านที่ 4',
        location: 'asdfasdfsd',
        menu: [
          MenuModel(name: 'menu d', price: 100),
          MenuModel(name: 'menu e', price: 200),
          MenuModel(name: 'menu f', price: 300),
          MenuModel(name: 'menu g', price: 400),
        ],
        image:
            'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
  ];

  List<FoodListModel>? dataTemp;
  FoodListModel? selectData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataTemp = dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Rastaurant")),
      body: Container(
        // padding: ,
        // margin: ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: TextField(
                        onTap: () {
                          setState(() {
                            dataTemp = dataList;
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            dataTemp = dataList
                                .where((item) => item.name!
                                    .toLowerCase()
                                    .contains(text.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'type in Rastaurant name...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataTemp?.length ?? 0,
                  itemBuilder: (BuildContext contect, int index) {
                    final item = dataTemp![index];
                    return Container(
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            selectData = item;
                            dataTemp = [];
                          });
                          print(item.name);
                        },
                        title: Text(item.name!),
                        subtitle: Text(item.location!),
                      ),
                    );
                  },
                ),
              ),
              selectData != null
                  ? Container(
                      child: Column(
                        children: [
                          Image.network(selectData!.image!),
                          Text(selectData!.name!),
                          Text(selectData!.location!),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: selectData!.menu!.length,
                            itemBuilder: (BuildContext contect, int index) {
                              final item = selectData!.menu![index];
                              return Container(
                                child: ListTile(
                                  title: Text(item.name!),
                                  subtitle: Text("${item.price!}"),
                                ),
                              );
                            },
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.red,
                              child: Text('Next Page')),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
