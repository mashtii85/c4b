import 'package:c4b/config/fixture_provider.dart';
import 'package:c4b/api_service/models/response/messageResModel.dart';
import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage(
      {super.key, required this.retryApiCallback, required this.errorMessageModel});

  final MessageResModel errorMessageModel;
  final void Function() retryApiCallback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            color: Theme
                .of(context)
                .primaryColor
                .withOpacity(.8),
            child: Center(
                child: Column(
                  children: [

                    const SizedBox(
                      height: 15,
                    ),
                    TextButton.icon(onPressed: retryApiCallback, icon: Icon(
                      Icons.refresh,
                      color: fixtures.colorPalette.white,
                      size: 35,
                    ), label: Text('Retry',
                      style: TextStyle(
                          color: fixtures.colorPalette.white, fontSize: 18),
                      textAlign: TextAlign.justify,
                    )),

                    Text(errorMessageModel.title ?? '',
                        style:
                        TextStyle(
                            color: fixtures.colorPalette.black, fontSize: 16),
                        textAlign: TextAlign.center),
                    const Spacer(),
                    Visibility(
                        visible: true,
                        child: Column(
                          children: [
                            Text(errorMessageModel.description ?? '',
                                style: TextStyle(
                                    color: fixtures.colorPalette.black,
                                    fontSize: 12),
                                textAlign: TextAlign.center),
                            Text('code: ${errorMessageModel.type ?? 'no code'}',
                                style: TextStyle(
                                    color: fixtures.colorPalette.black,
                                    fontSize: 12),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: fixtures.padding.d16,
                            )
                          ],
                        ))
                  ],
                )),
          )),
    );
  }
}
