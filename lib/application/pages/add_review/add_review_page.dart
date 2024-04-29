// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_archi/application/pages/add_review/bloc/add_review_bloc.dart';
import 'package:clean_archi/injection.dart';
import 'package:flutter/material.dart';

import 'package:clean_archi/domain/entities/resto_detail_entity.dart';

class AddReviewPage extends StatefulWidget {
  final RestoDetailEntity restoDetailEntity;
  const AddReviewPage({
    Key? key,
    required this.restoDetailEntity,
  }) : super(key: key);

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final AddReviewBloc addReviewBloc = sl();
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addReviewBloc.add(AddReviewPageEvent(addReviewRequest: ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('Add Review'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      hintText: 'Review',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     closeKeyboard(context);
                      //   },
                      //   child: const Text('Close Keyboard'),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
