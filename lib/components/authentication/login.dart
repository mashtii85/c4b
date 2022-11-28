import 'package:c4b/components/authentication/provider.dart';
import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/components/models/request/credential_model.dart';
import 'package:c4b/components/models/response/credential_res_model.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:c4b/config/theme/theme.dart';
import 'package:c4b/repository/api_service_repo/models/response/baseResModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameTextController =
      useTextEditingController(text: 'tester3');
  final TextEditingController _passwordTextController =
      useTextEditingController(text: '74Ho4KxW');
  final FocusNode _userFocusNode = useFocusNode();
  final FocusNode _urlFocusNode = useFocusNode();

  final FocusNode _passwordFocusNode = useFocusNode();
  final sizedBox = SizedBox(height: fixtures.sizedBox.d08);

  Login({super.key});

  final loginPressed = useState(false);
  final model = useState<CredentialModelReq?>(null);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authWatcher = ref.watch(authenticationProvider(model.value));


    // ref.read(authenticationProvider(CredentialModelReq(username: '',password: '')));
    double width = MediaQuery.of(context).size.width;
    // var a = ref.watch(authenticationProvider);
// print(a);
// Future<String> a=ref.watch(authenticationProvider('2'));

    // ref.listen<String,String>(FutureProviderFamily((ref1) => authenticationProvider), (prev, next) {
    //   print(prev);
    //   print(next);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('yoyo')));
    // });

    // var authWatcher = ref.watch(authenticationProvider(model.value));
    // if(authWatcher.hasError){
    //   // model.value=null;
    //   ;
    // }
    var listener = ref.listen(authenticationProvider(model.value), (previous, next) {
      if(next!.hasValue! && next.value!=null){
        debugPrint('value is ========================> ${next.value}');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('yoyo')));
      }
      else if(next!.hasError){
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(content: Text(next!.error!.toString())));
      }
      // print('state=>',previous);
      // switch(previous){
      //   case AsyncValue.data(value)
      // }
    });
    print(authWatcher);
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(
            fixtures.padding.d16,
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _pictureBox(context),
              sizedBox,
              _title("User Name"),
              _userName(context),
              sizedBox,
              _title("Password"),
              _password(context),
              sizedBox,
              SizedBox(
                height: fixtures.sizedBox.d20,
              ),
              _signInButton(width, authWatcher.isLoading, ref),
              sizedBox,
              sizedBox,
              _showWarningDialog(context),
            ],
          ),
        ),
      ),
    ));
  }

  Padding _title(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixtures.padding.d08),
      child: Text(text, style: fixtures.font.titleMedium),
    );
  }

  SizedBox _pictureBox(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Image.asset(
        Constants().loginImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Directionality _userName(context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        validator: (value) {
          if (value!.length <= 3) {
            return 'Username length should be greater than 3';
          }
          return null;
        },
        key: const Key('userName'),
        focusNode: _userFocusNode,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        controller: _userNameTextController,
      ),
    );
  }

  SizedBox _password(BuildContext context) {
    final isObscureText = useState(true);

    return SizedBox(
      height: fixtures.sizedBox.d48,
      child: TextFormField(
        validator: (value) {
          if (value!.length <= 3) {
            return 'Password length should be greater than 3';
          }
          return null;
        },
        key: const Key('password'),
        obscureText: isObscureText.value,
        focusNode: _passwordFocusNode,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_urlFocusNode);
        },
        controller: _passwordTextController,
        decoration: InputDecoration(
          prefixIcon: GestureDetector(
              onTap: () {
                isObscureText.value = !isObscureText.value;
              },
              child: Container(
                margin: EdgeInsets.all(fixtures.margin.d04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(fixtures.borderRadius),
                  color: fixtures.colorPalette.primaryColor,
                ),
                child: Icon(
                  isObscureText.value ? Icons.visibility_off : Icons.visibility,
                  color: fixtures.colorPalette.white,
                ),
              )),
        ),
      ),
    );
  }

  Widget _signInButton(width, isLoading, WidgetRef ref) {
    // var a = ref.watch(authenticationProvider);
    // a.value.login(credentials)
    // var b = ref.listen(authenticationProvider(value), (previous, next) {
    //   print('value ${previous!.value!.message![0]!.description!}');
    //   print('loading=> ${previous.isLoading}');
    // });

    return InkWell(
        key: const Key('signInButton'),
        onTap: isLoading
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  model.value = CredentialModelReq(
                      username: _userNameTextController.text,
                      password: _passwordTextController.text);
                  // ref.read(authenticationProvider).value!.login(CredentialModelReq(
                  //     username: _userNameTextController.text,
                  //     password: _passwordTextController.text));
                  // ref.read(authenticationProvider.).
                  // ref.read(authenticationProvider(CredentialModelReq(
                  //     username: _userNameTextController.text,
                  //     password: _passwordTextController.text)));
                }
              },
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: fixtures.colorPalette.primaryColor,
                borderRadius: BorderRadius.circular(fixtures.borderRadius)),
            child: isLoading
                ? CustomProgressIndicator(
                    color: fixtures.colorPalette.white,
                    size: 15,
                    type: ProgressIndicatorType.ChasingDots,
                  )
                : const Text('Login')));
  }

  Widget _showWarningDialog(context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Not implemented yet!')));
      },
      child: const Text(
        'Having trouble signing in ?',
      ),
    );
  }
}
