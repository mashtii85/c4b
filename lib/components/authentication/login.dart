import 'package:c4b/components/authentication/provider.dart';
import 'package:c4b/components/common/custom_progress_indicator.dart';
import 'package:c4b/config/constants.dart';
import 'package:c4b/config/fixture_provider.dart';
import 'package:c4b/config/theme/theme.dart';
import 'package:c4b/repository/login_repo/models/request/credential_model.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {}, []);
    // ref.read(authenticationProvider(CredentialModelReq(username: '',password: '')));
    double width = MediaQuery.of(context).size.width;
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
              _signInButton(width, false, ref),
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

  Widget _signInButton(width, isLoading, ref) {
    return InkWell(
      key: const Key('signInButton'),
      onTap: isLoading
          ? null
          : () {
              if (_formKey.currentState!.validate()) {
                ref.read(authenticationProvider(CredentialModelReq(
                    username: _userNameTextController.text, password: _passwordTextController.text)));
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
