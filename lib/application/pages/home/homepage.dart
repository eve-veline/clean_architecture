import 'package:clean_archi/application/pages/constant/page_name.dart';
import 'package:clean_archi/application/pages/home/bloc/home_bloc.dart';
import 'package:clean_archi/domain/usecases/home_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = sl();

  @override
  void initState() {
    homeBloc.add(HomeRestoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //         icon: Icon(Icons.search, color: Colors.black,),
          //         onPressed: () {
          //           Navigator.pushNamed(context, PageName.searchPage);
          //         }),
          //   ],
          // ),
          BlocConsumer<HomeBloc, HomeState>(
            bloc: homeBloc,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case HomeStatus.success:
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Restaurant',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff338fc2),
                        ),
                        // style: GoogleFonts.montserrat(
                        //   fontSize: 30,
                        //   color: Color(0xff338fc2),
                        // ),
                      ),
                      SizedBox(
                        height: 630,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Jumlah kolom dalam grid
                            crossAxisSpacing: 8, // Spasi antar kolom
                            mainAxisSpacing: 8, // Spasi antar baris
                          ),
                          itemCount: state.restaurants?.length ?? 0,
                          itemBuilder: (context, index) {
                            final resto = state.restaurants![index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageName.detailPage,
                                    arguments: resto);
                              },
                              child: Card(
                                color: Colors.white,
                                margin: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio:
                                          16 / 9, // Rasio aspek untuk gambar
                                      child: Image.network(
                                        "https://restaurant-api.dicoding.dev/images/small/${resto.pictureId}",
                                        fit: BoxFit
                                            .cover, // Menyesuaikan gambar ke kotak
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            resto.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // SizedBox(height: 4),
                                          // Text(
                                          //   resto.description,
                                          //   maxLines:
                                          //       2, // Batasi jumlah baris untuk deskripsi
                                          //   overflow: TextOverflow
                                          //       .ellipsis, // Tampilkan elipsis jika terlalu panjang
                                          // ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(resto.city),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(resto.rating.toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );

                case HomeStatus.error:
                  return const Center(
                    child: Text('Error!'),
                  );
                default:
                  return const Center(
                    child: Text('Loading...'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
