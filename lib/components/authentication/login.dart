import 'package:c4b/components/Home/home.dart';
import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/authorize/cubit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    return BlocConsumer<AuthorizeCubit, AuthorizeState>(
      bloc: context.read<AuthorizeCubit>(),
      listener: (context,state){},
      builder: (context, state) {
        if (state is AuthorizeUninitialized) {
          context.read<AuthorizeCubit>().appStarted();
        } else if (state is AuthorizeUnauthenticated) {
          return _LoginPage();
        } else if (state is AuthorizeLoading) {
          return Text('loading');
        } else if (state is AuthorizeAuthenticated) {
          // contextProvider.logout = context.read<AuthorizeCubit>().logOut;
          return const Home();
        }
        return Text('loading');
      },
    );

  }
  Widget _LoginPage(){
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
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
              _signInButton(width, true),
              sizedBox,
              sizedBox,
              _showWarningDialog(context),
            ],
          ),
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

  Widget _signInButton(width, isLoading) {
    return InkWell(
      key: const Key('signInButton'),
      onTap: isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {}
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
