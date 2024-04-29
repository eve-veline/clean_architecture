import 'package:clean_archi/application/pages/constant/page_name.dart';
import 'package:clean_archi/application/pages/search/bloc/search_bloc.dart';
import 'package:clean_archi/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBloc searchBloc = sl();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
    searchBloc.add(SearchPageEvent(query: ''));
  }

  late TextEditingController _searchController;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Here...",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocConsumer<SearchBloc, SearchState>(
              bloc: searchBloc,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.status) {
                  case SearchStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  case SearchStatus.success:
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Restaurant',
                          style: TextStyle(
                            color: Color(0xff338fc2),
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 600,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: state.searchEntity?.restaurants.length,
                              itemBuilder: (context, index) {
                                final resto =
                                    state.searchEntity?.restaurants[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PageName.detailPage,
                                        arguments: resto);
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image.network(
                                            "https://restaurant-api.dicoding.dev/images/large/${resto?.pictureId}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                resto!.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(resto.rating.toString()),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  case SearchStatus.error:
                    return Center(
                      child: Text('Error!'),
                    );

                  default:
                    return Center(
                      child: Text('Loading....'),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
