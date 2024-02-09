import 'package:apidemo/cartscreen.dart';
import 'package:apidemo/controller.dart';
import 'package:apidemo/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'apirepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLoading = true;
    });
    APIRepo().loadPostData().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print("json data ${jsonList.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading == true
            ? CircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Welcome welcome = Welcome(
                            albumId: jsonList[index].albumId,
                            id: jsonList[index].id,
                            title: jsonList[index].title,
                            url: jsonList[index].url,
                            thumbnailUrl: jsonList[index].thumbnailUrl);

                        controller.addCartData(welcome);
                      },
                      child: Container(
                          height: 50,
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            jsonList[index].id.toString(),
                            style: TextStyle(fontSize: 20),
                          ))),
                    ),
                  );
                },
              ),
      ),
      /*ListView.builder(
        itemCount: jsonList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return Text(

        "$index");
      },),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CartScreen(),
          ));

          APIRepo().loadPostData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
