import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:da_assessment/core/ui/custom_appBar.dart';
import 'package:da_assessment/core/ui/theme/decorations.dart';
import 'package:da_assessment/core/utils/form_utils/form_state_mixin.dart';
import 'package:da_assessment/core/utils/form_utils/form_utils.dart';
import 'package:da_assessment/core/utils/navigation.dart';
import 'package:da_assessment/core/utils/validators/length_validator.dart';
import 'package:da_assessment/core/utils/validators/phone_number_validation.dart';
import 'package:da_assessment/feautre/add_beneficary/data/repository/beneficiary_reopsitory.dart';
import 'package:da_assessment/feautre/add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../core/ui/custom_text_field.dart';
import '../../../core/ui/dialogs/dialogs.dart';
import '../../../core/utils/validators/base_validator.dart';
import '../../../core/utils/validators/required_validator.dart';
import '../../../main.dart';
import '../domain/usecase/add_beneficiary_usecase.dart';

class AddBeneficiary extends StatefulWidget {
  const AddBeneficiary({super.key});

  @override
  State<AddBeneficiary> createState() => _AddBeneficiaryState();
}

class _AddBeneficiaryState extends State<AddBeneficiary> with FormStateMinxin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Beneficiary'),
      body: SingleChildScrollView(
        child: addBeneficiaryForm(),
      ),
    );
  }

  Widget addBeneficiaryForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: form.key,
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Beneficiary Name',
              textEditingController: form.controllers[0],
              focusNode: form.nodes[0],
              nextFocusNode: form.nodes[1],
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [
                    RequiredValidator(),
                    LengthValidator(length: 20),
                  ],
                );
              },
            ),
            CustomTextField(
              labelText: 'Beneficiary Number',
              textEditingController: form.controllers[1],
              focusNode: form.nodes[1],
              keyboardType: TextInputType.phone,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [
                    RequiredValidator(),
                    PhoneNumberValidator(),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            CreateModel(
              onTap: () {
                return form.validate();
              },
              onSuccess: (TopUpBeneficiaryEntity model) {
                Dialogs.showSnackBar(
                  message: 'Beneficiary Added Successfully',
                  typeSnackBar: AnimatedSnackBarType.success,
                );
                Navigation.pop(value: model);
                print(model);
              },
              useCaseCallBack: (model) => AddBeneficiaryUseCase(getIt.get<ConcreteBeneficiaryRepository>()).call(
                params: AddBeneficiaryParams(
                  beneficiaryName: form.controllers[0].text,
                  beneficiaryNumber: form.controllers[1].text,
                ),
              ),
              withValidation: true,
              child: DecoratedBox(
                  decoration: buttonDecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  int numberOfFields() => 2;
}
