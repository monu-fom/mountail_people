import 'dart:convert';

import 'package:flutter/material.dart';

import '../network/api_interface.dart';
import '../network/network_call.dart';
import '../network/res_models/login_model.dart';
import '../network/res_models/parent_model.dart';
import '../utils/constant.dart';
import '../utils/customLoader.dart';
import '../utils/light_color.dart';
import '../utils/utility.dart';
import '../widgets/customFlatButton.dart';
import '../widgets/customWidgets.dart';
import '../widgets/googleLoginButton.dart';

class SignIn extends StatefulWidget {
  final VoidCallback? loginCallback;

  const SignIn({Key? key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _emailController = TextEditingController(text: 'varun.user@flashonmind.com');
    _passwordController = TextEditingController(text: '12345678');
    loader = CustomLoader();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 150),
            _entryField('Enter email', controller: _emailController),
            _entryField('Enter password',
                controller: _passwordController, isPassword: true),
            _emailLoginButton(context),
            const SizedBox(height: 20),
            _labelButton('Forget password?', onPressed: () {
              Navigator.of(context).pushNamed('/ForgetPasswordPage');
            }),
            const Divider(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            GoogleLoginButton(
              loginCallback: widget.loginCallback!,
              loader: loader,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String hint,
      {required TextEditingController controller, bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _labelButton(String title, {Function? onPressed}) {
    return TextButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Text(
        title,
        style: TextStyle(
            color: TwitterColor.dodgeBlue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailLoginButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      child: CustomFlatButton(
        label: "Submit",
        onPressed: _emailLogin,
        borderRadius: 30,
      ),
    );
  }

  void _emailLogin() async {
    // var state = Provider.of<AuthState>(context, listen: false);
    // if (state.isbusy) {
    //   return;
    // }
    loader.showLoader(context);
    var isValid = Utility.validateCredentials(
        context, _emailController.text, _passwordController.text);
    if (isValid) {
      Map<String, dynamic> postData = {
        'email' : _emailController.text,
        'password' : _passwordController.text
      };
      ParentModel parentModel = await NetworkCall.postJsonCall(ApiInterface.login, postData);
      loader.hideLoader();
      if(parentModel.status == 'Success'){
        LoginModel loginModel = loginModelFromJson(jsonEncode(parentModel.data));
        Utility.setStringPref(Constants.userId, '${loginModel.userId}');
        Utility.setStringPref(Constants.userToken, '${loginModel.token}');
        Utility.setBoolPref(Constants.isUserLogin, true);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
      else{
        Utility.customSnackBar(context, parentModel.message!);
      }
    } else {
      loader.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: customText(
            'Sign in',
            context: context, style: const TextStyle(fontSize: 20)
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}
