import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';


import 'config/theme/theme.dart';

void main() {
  // withFixtures = Fixtures(
  //     drawer: const Drawer(),
  //     appLogo: const Logo(),
  //     loadingPage: const Loading(),
  //     colorPalette: colorPalette,
  //     borderRadius: 5,
  //     margin: Distance(),
  //     padding: Distance(),
  //     sizedBox: Distance(),
  //     elevation: 3,
  //     font:font
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(context, ''),
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

  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late TextEditingController _urlController;
  FocusNode _userFocusNode = FocusNode();
  FocusNode _urlFocusNode = FocusNode();

  FocusNode _passwordFocusNode = FocusNode();
  bool _isObscureText = true;
  var sizedBox = SizedBox(height: fixtures.sizedBox.d08);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: fixtures.padding.d16,
              right: fixtures.padding.d16,
              bottom: fixtures.padding.d08),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _pictureBox(),
              sizedBox,
              _title("userName"),
              _userName(),
              sizedBox,
              _title("password"),
              _password(),
              sizedBox,

              SizedBox(
                height: fixtures.sizedBox.d20,
              ),
              _signInButton(width, true),
              sizedBox,
              sizedBox,
              _showWarningDialog(),
            ],
          ),
        ),
      ),

    );
  }
  Padding _title(String translationKey) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixtures.padding.d08),
      child: Text('Title',
          style: fixtures.font.titleMedium
              .merge(TextStyle(color: fixtures.colorPalette.grey[300]))),
    );
  }

  SizedBox _pictureBox() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Image.asset(
        Constants().loginImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Directionality _userName() {
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

  Widget _password() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: fixtures.sizedBox.d48,
        child: TextFormField(
          validator: (value) {
            if (value!.length <= 3) {
              return 'Password length should be greater than 3';
            }
            return null;
          },
          key: const Key('password'),
          obscureText: _isObscureText,
          focusNode: _passwordFocusNode,
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(_urlFocusNode);
          },
          controller: _passwordTextController,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(fixtures.margin.d04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(fixtures.borderRadius),
                    color: fixtures.colorPalette.primaryColor,
                  ),
                  child: Icon(
                    _isObscureText ? Icons.visibility_off : Icons.visibility,
                    color: fixtures.colorPalette.white,
                  ),
                )),
          ),
        ),
      ),
    );
  }


  Widget _signInButton(width, isLoading) {
    return InkWell(
      key: const Key('signInButton'),
      onTap: isLoading
          ? null
          : () {
        if (_formKey.currentState!.validate()) {
          // context.read<AuthenticateCubit>().loginButtonPressed(
          //     CredentialReqModel(
          //         userName: _userNameTextController.text,
          //         grantType: "password",
          //         password: _passwordTextController.text),
          //     _urlController.text);
        }
        // http://192.168.1.50:8084
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
              : const Text(
           'Login'
          )),
    );
  }

  Widget _showWarningDialog() {
    return InkWell(
      onTap: (){},
      child: const Text('Having trouble signing in ?',
        ),
    );
  }
}
