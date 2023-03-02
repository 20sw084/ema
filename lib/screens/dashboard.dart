import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ema/screens/view_details.dart';
import 'package:ema/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../widgets/horizontal_card.dart';
import 'chart_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final fireStore =
      FirebaseFirestore.instance.collection("budgetTree").snapshots();
  final fireStorePost = FirebaseFirestore.instance.collection("budgetTree");

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Dashboard"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.incomplete_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChartScreen(),
                  ),
                );
                },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            HorizontalCard(),
            Flexible(
              child: StreamBuilder(
                stream: fireStore,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text("Something Went Wrong");
                  }
                  return ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: List.generate(snapshot.data.docs.length, (index) {
                        return SlideMenu(
                          menuItems: <Widget>[
                            // Container(
                            //   color: Colors.black12,
                            //   child: IconButton(
                            //     icon: const Icon(Icons.edit),
                            //     onPressed: () {
                            //
                            //     },
                            //   ),
                            // ),
                            Container(
                              color: Colors.red,
                              child: IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  fireStorePost
                                      .doc(snapshot.data.docs[index]['id']
                                          .toString())
                                      .delete()
                                      .then(
                                        (value) => Utils().toastMessage(
                                          'Deleted Successfully',
                                        ),
                                      )
                                      .onError(
                                        (
                                          error,
                                          stackTrace,
                                        ) =>
                                            Utils().toastMessage(
                                          'Something Went wrong',
                                        ),
                                      );
                                },
                              ),
                            ),
                          ],
                          child: GestureDetector(
                            child: ListTile(
                              leading: Text((index + 1).toString()),
                              trailing: Text(
                                "${snapshot.data.docs[index]["amount"]} PKR",
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              title: Text(
                                snapshot.data.docs[index]["name"],
                              ),
                            ),
                            onTap: () {
                              log(snapshot.data.docs[index]["id"].toString());
                              log(snapshot.data.docs[index]["userName"].toString());
                              log(snapshot.data.docs[index]["name"].toString());
                              log(snapshot.data.docs[index]["amount"].toString());
                              log(snapshot.data.docs[index]["description"].toString());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewDetails(
                                    id: snapshot.data.docs[index]["id"],
                                    uName: snapshot.data.docs[index]["userName"],
                                    aName: snapshot.data.docs[index]["name"],
                                    aType: snapshot.data.docs[index]["name"],
                                    amount: snapshot.data.docs[index]["amount"],
                                    desc: snapshot.data.docs[index]["description"],
                                    date: snapshot.data.docs[index]["date"],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  const SlideMenu({Key? key, required this.child, required this.menuItems})
      : super(key: key);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Here the end field will determine the size of buttons which will appear after sliding
    //If you need to appear them at the beginning, you need to change to "+" Offset coordinates (0.2, 0.0)
    final animation =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(-0.2, 0.0))
            .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    return GestureDetector(onHorizontalDragUpdate: (data) {
      // we can access context.size here
      setState(() {
        //Here we set value of Animation controller depending on our finger move in horizontal axis
        //If you want to slide to the right, change "-" to "+"
        _controller.value -= (data.primaryDelta! / (context.size!.width * 0.2));
      });
    }, onHorizontalDragEnd: (data) {
      //To change slide direction, change to data.primaryVelocity! < -1500
      if (data.primaryVelocity! > 1500) {
        _controller.animateTo(.0);
      } else if (_controller.value >= .5 || data.primaryVelocity! < -1500) {
        _controller.animateTo(1.0);
      } else {
        _controller.animateTo(.0);
      }
    }, child: LayoutBuilder(builder: (context, constraint) {
      return Stack(
        children: [
          SlideTransition(
            position: animation,
            child: widget.child,
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                //To change slide direction to right, replace the right parameter with left:
                return Positioned(
                  right: .0,
                  top: .0,
                  bottom: .0,
                  width: constraint.maxWidth * animation.value.dx * -1,
                  child: Row(
                    children: widget.menuItems.map((child) {
                      return Expanded(
                        child: child,
                      );
                    }).toList(),
                  ),
                );
              })
        ],
      );
    }));
  }
}
