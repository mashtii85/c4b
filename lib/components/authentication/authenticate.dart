import 'package:c4b/components/authentication/cubit/authentication/cubit.dart';
import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:c4b/components/authentication/models/request/credential_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameTextController =
      TextEditingController(text: 'tester3');

  final TextEditingController _passwordTextController =
      TextEditingController(text: '74Ho4KxW');

  final FocusNode _userFocusNode = FocusNode();

  final FocusNode _urlFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final sizedBox = SizedBox(height: fixtures.sizedBox.d08);

  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthenticateCubit, AuthenticateStates>(
              bloc: context.watch<AuthenticateCubit>(),
              listener: (context, state) {
                if (state is AuthenticateFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Failed')));
                } else if (state is UserAuthenticateSucceeded) {}
              },
              builder: (context, state) {
                return _loginPage(state is AuthenticateLoading);
              })),
    );
  }

  Widget _loginPage(bool isLoading) {
    double width = MediaQuery.of(context).size.width;

    return Form(
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
            _title("userName"),
            _userName(context),
            sizedBox,
            _title("password"),
            _password(context),
            sizedBox,
            SizedBox(
              height: fixtures.sizedBox.d20,
            ),
            _signInButton(width, isLoading),
            sizedBox,
            sizedBox,
            _showWarningDialog(context),
          ],
        ),
      ),
    );
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

  TextFormField _userName(context) {
    return TextFormField(
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
    );
  }

  SizedBox _password(BuildContext context) {
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
        obscureText: isObscureText,
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
                  isObscureText = !isObscureText;
                });
              },
              child: Container(
                margin: EdgeInsets.all(fixtures.margin.d04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(fixtures.borderRadius),
                  color: fixtures.colorPalette.primaryColor,
                ),
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: fixtures.colorPalette.white,
                ),
              )),
        ),
      ),
    );
  }

  Widget _signInButton(double width, bool isLoading) {
    return InkWell(
      key: const Key('signInButton'),
      onTap: isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticateCubit>().loginButtonPressed(
                    CredentialReqModel(
                        username: _userNameTextController.text,
                        password: _passwordTextController.text));
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
              : const Text('Login')),
    );
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
