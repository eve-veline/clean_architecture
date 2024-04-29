// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_archi/application/pages/detail/bloc/detail_bloc.dart';
import 'package:clean_archi/domain/entities/resto_entity.dart';
import 'package:clean_archi/injection.dart';

class DetailPage extends StatefulWidget {
  final RestoEntity restoEntity;

  const DetailPage({
    Key? key,
    required this.restoEntity,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailBloc detailBloc = sl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.microtask(() {
    //   BlocProvider.of<DetailBloc>(context).add(DetailPageEvent(id: widget.restoEntity.id));
    // });
    detailBloc.add(DetailPageEvent(id: 'rqdv5juczeskfw1e867'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant',
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<DetailBloc, DetailState>(
          bloc: detailBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.status) {
              case DetailStatus.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case DetailStatus.success:
                final resto = state.restaurants;
                String foodsText = '';
                for (var foods in resto!.menus.foods) {
                  foodsText += '$foods\n';
                }
                String drinksText = '';
                for (var drinks in resto.menus.drinks) {
                  drinksText += '$drinks\n';
                }
                return Column(
                  children: [
                    Image.network(
                        'https://restaurant-api.dicoding.dev/images/large/${resto.pictureId}'),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ExpandablePanel(
                            header: Text(
                              '${resto.name} Descriptions',
                            ),
                            collapsed: Text(
                              resto.description,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Text(
                              resto.description,
                              softWrap: true,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Categories: ${resto.categories}',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      resto.rating.toString(),
                                    ),
                                  ),
                                ],
                              ),
                              Text('${resto.address}, ${resto.city}'),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Reviews',
                                  ),
                                  collapsed: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var i = 0; i < 5; i++)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nama: ${resto.customerReviews[i].name}',
                                            ),
                                            Text(
                                              'Ulasan: ${resto.customerReviews[i].review}',
                                            ),
                                            Text(
                                                'Tanggal: ${resto.customerReviews[i].date}'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  expanded: Column(
                                    children: [
                                      for (var j = 0;
                                          j < resto.customerReviews.length;
                                          j++)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nama: ${resto.customerReviews[j].name}',
                                            ),
                                            Text(
                                              'Ulasan: ${resto.customerReviews[j].review}',
                                            ),
                                            Text(
                                              'Tanggal: ${resto.customerReviews[j].date}',
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Divider(),
                              Text(
                                'MENU',
                              ),
                              CarouselSlider.builder(
                                  itemCount: 2,
                                  itemBuilder: (BuildContext context,
                                      int itemIndex, int pageViewIndex) {
                                    if (itemIndex == 0) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Foods',
                                            ),
                                            Text(
                                              foodsText,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (itemIndex == 1) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Drinks',
                                            ),
                                            Text(
                                              drinksText,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return Container();
                                  },
                                  options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  aspectRatio: 2.0,
                                  initialPage: 2,
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );

              case DetailStatus.error:
                return Center(
                  child: Text('Error!'),
                );

              default:
                return Center(
                  child: Text('....'),
                );
            }
          },
        ),
      ),
    );
  }
}
