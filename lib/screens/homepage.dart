import 'package:flutter/material.dart';
import 'package:user_info/models/user_info_model.dart';
import 'package:user_info/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person_2,
                  size: 40,
                  color: Colors.blueAccent,
                ),
                Text(
                  "Random User",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.verified_user_sharp,
                  size: 40,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      body: FutureBuilder<List<UserInfoModel>>(
        future: service.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      Card(
                        elevation: 8,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user.picture!),
                                  ),
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Colors.black.withOpacity(0.1)),
                              Text(
                                "Gender: ${user.gender}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Email: ${user.email}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Location: ${user.location}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Phone: ${user.phone}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
