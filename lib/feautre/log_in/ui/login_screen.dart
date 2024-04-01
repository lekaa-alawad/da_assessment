import 'package:da_assessment/core/utils/form_utils/text_field_ext.dart';
import 'package:da_assessment/core/utils/validators/email_validator.dart';
import 'package:da_assessment/feautre/log_in/data/repository/concrete_user_repository.dart';
import 'package:da_assessment/feautre/log_in/domain/entity/login_response_entity.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:flutter/material.dart';

import '../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../core/ui/custom_appBar.dart';
import '../../../core/ui/custom_text_field.dart';
import '../../../core/utils/form_utils/form_state_mixin.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/utils/validators/base_validator.dart';
import '../../../core/utils/validators/required_validator.dart';
import '../../home_page/ui/home_page_screen.dart';
import '../data/data_source/concrete_user_datasource.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FormStateMinxin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Log in'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: form.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Welcome', style: Theme.of(context).textTheme.headlineMedium),
                ),
                CustomTextField(
                  labelText: 'email',
                  textEditingController: form.controllers[0],
                  focusNode: form.nodes[0],
                  nextFocusNode: form.nodes[1],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return BaseValidator.validateValue(
                      context,
                      value!,
                      [
                        RequiredValidator(),
                        EmailValidator(),
                      ],
                    );
                  },
                ),
                CustomTextField(
                  labelText: 'Password',
                  textEditingController: form.controllers[1],
                  focusNode: form.nodes[1],
                  validator: (value) {
                    return BaseValidator.validateValue(
                      context,
                      value!,
                      [
                        RequiredValidator(),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                CreateModel(
                  onTap: () {
                    return form.validate();
                  },
                  onSuccess: (LoginResponseEntity model) {
                    Navigation.pushReplacement(const HomePageScreen());
                  },
                  useCaseCallBack: (model) =>
                      LogInUseCase(ConcreteUserRepository(remoteDataSource: ConcreteUserRemoteDataSource())).call(
                          params: LogInParams(email: form.controllers[0].text, password: form.controllers[1].text)),
                  withValidation: true,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  int numberOfFields() => 2;
}
