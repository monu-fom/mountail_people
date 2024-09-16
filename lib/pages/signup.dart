import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mountain_people/utils/utility.dart';

import '../../../network/network_call.dart';
import '../network/api_interface.dart';
import '../network/res_models/parent_model.dart';
import '../utils/customLoader.dart';
import '../widgets/customFlatButton.dart';
import '../widgets/customWidgets.dart';
import '../widgets/googleLoginButton.dart';

class Signup extends StatefulWidget {
  final VoidCallback? loginCallback;

  const Signup({Key? key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late CustomLoader loader;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    loader = CustomLoader();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Container(
      height: Utility.getPageHeight(context) - 88,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _entryField('Name', controller: _nameController),
            _entryField('Enter email',
                controller: _emailController,keyboardType: TextInputType.emailAddress),
            _entryField('Enter mobile',
                controller: _mobileController, keyboardType: TextInputType.number),
            _submitButton(context),
            const Divider(height: 30),
            const SizedBox(height: 30),
            GoogleLoginButton(
              loginCallback: widget.loginCallback,
              loader: loader,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String hint,
      {required TextEditingController controller,
      bool isPassword = false,
      TextInputType keyboardType = TextInputType.text,
      bool isEmail = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(color: Colors.blue),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      child: CustomFlatButton(
        label: "Sign up",
        onPressed: () => _submitForm(context),
        borderRadius: 30,
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (_nameController.text.isEmpty) {
      Utility.customSnackBar(context, 'Please enter name');
      return;
    }
    if (_nameController.text.length > 27) {
      Utility.customSnackBar(context, 'Name length cannot exceed 27 character');
      return;
    }
    if (_emailController.text.isEmpty) {
      Utility.customSnackBar(context, 'Please enter email address');
      return;
    } if (_mobileController.text.isEmpty) {
      Utility.customSnackBar(context, 'Please enter mobile');
      return;
    }
    if (_mobileController.text.length > 10) {
      Utility.customSnackBar(context, 'Mobile number should be 10 digit');
      return;
    }

    loader.showLoader(context);

    Map<String,dynamic> postData = {
      'name' : _nameController.text,
      'email' : _emailController.text,
      'mobile' : _mobileController.text,
    };

    ParentModel parentModel = await NetworkCall.postJsonCall(ApiInterface.register, postData);
    loader.hideLoader();
    print(parentModel);
    if(parentModel.status == 'Success'){
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
    else{
      Utility.customSnackBar(context, parentModel.message!);
    }


    // var state = Provider.of<AuthState>(context, listen: false);
    // Random random = Random();
    // int randomNumber = random.nextInt(8);
    //
    // UserModel user = UserModel(
    //   email: _emailController.text.toLowerCase(),
    //   bio: 'Edit profile to update bio',
    //   // contact:  _mobileController.text,
    //   displayName: _nameController.text,
    //   dob: DateTime(1950, DateTime.now().month, DateTime.now().day + 3).toString(),
    //   location: 'Somewhere in universe',
    //   profilePic: Constants.dummyProfilePicList[randomNumber],
    //   isVerified: false,
    // );
    // state
    //     .signUp(
    //   user,
    //   password: _passwordController.text,
    //   context: context,
    // )
    //     .then((status) {
    //   print(status);
    // }).whenComplete(
    //   () {
    //     loader.hideLoader();
    //     if (state.authStatus == AuthStatus.LOGGED_IN) {
    //       Navigator.pop(context);
    //       if (widget.loginCallback != null) widget.loginCallback!();
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          'Sign Up',
          context: context,
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _body(context)),
    );
  }
}
