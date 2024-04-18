import 'package:clean_archi/application/pages/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeRestoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case HomeStatus.success:
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Jumlah kolom dalam grid
                        crossAxisSpacing: 8, // Spasi antar kolom
                        mainAxisSpacing: 8, // Spasi antar baris
                      ),
                      itemCount: state.restaurants?.length ?? 0,
                      itemBuilder: (context, index) {
                        final resto = state.restaurants![index];
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.all(8),
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
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        resto.name,
                                        style: TextStyle(
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
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(resto.city),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              SizedBox(width: 2),
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
              return Center(
                child: Text('Error!'),
              );
            default:
              return Center(
                child: Text('Loading...'),
              );
          }
        },
      ),
    );
  }
}
