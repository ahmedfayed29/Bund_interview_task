part of '../view.dart';

class _LoginInput extends StatelessWidget {
  const _LoginInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Column(
      children: [
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          hint: tr('email'),
          controller: cubit.email,
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 24.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: InkWell(
            onTap: () => cubit.changeViewPassword(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cubit.viewPassword
                    ? Icons.visibility
                    : Icons.visibility_off)
              ],
            ),
          ),
          secure: cubit.viewPassword,
          hint: tr('password'),
          controller: cubit.password,
          inputType: TextInputType.phone,
        ),
        SizedBox(
          height: 16.height,
        ),
        Row(
          children: [
            Checkbox(
                value: cubit.acceptTerms,
                activeColor: AppColors.primary,
                onChanged: (val) => cubit.changeTerms()),
            AppText(
                title: tr('remember_me'),
                color: AppColors.primary,
                appTextStyle: AppTextStyle.subBody),
            Spacer(),
            AppText(
                title: tr('forget_password'),
                color: AppColors.primary,
                appTextStyle: AppTextStyle.subBody),
          ],
        )
      ],
    );
  }
}
