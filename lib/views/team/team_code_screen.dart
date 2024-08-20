import 'package:case_study_app/cubits/team/team_cubit.dart';
import 'package:case_study_app/style/color/color_styles.dart';
import 'package:case_study_app/style/padding/padding_style.dart';
import 'package:case_study_app/style/size/size_style.dart';
import 'package:case_study_app/style/text/text_style.dart';
import 'package:case_study_app/widgets/button/m_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeamCodeScreen extends StatefulWidget {
  const TeamCodeScreen({super.key});

  @override
  State<TeamCodeScreen> createState() => _TeamCodeScreenState();
}

class _TeamCodeScreenState extends State<TeamCodeScreen> {
  TeamCubit? cubit;
  late AppLocalizations locale;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _pinController = TextEditingController();
  bool errorState = false;

  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  final defaultPinTheme = const PinTheme(
    width: 50,
    height: 50,
    textStyle: TextStyle(
        color: Color.fromRGBO(70, 69, 66, 1),
        fontSize: 30,
        fontWeight: FontWeight.w400),
  );

  @override
  Widget build(BuildContext context) {
    cubit = cubit ?? BlocProvider.of<TeamCubit>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: screenPadding,
            child: BlocConsumer<TeamCubit, TeamState>(
              listener: (context, state) {
                if (state is TeamError) {
                  errorState = true;
                } else if (state is TeamUninitialized) {
                  errorState = false;
                } else if (state is TeamInitialized) {
                  errorState = false;
                }
              },
              builder: (context, state) {
                locale = AppLocalizations.of(context)!;
                return Column(
                  children: [
                    sizebox30H,
                    const Spacer(),
                    Center(
                      child: SvgPicture.asset("assets/icons/ic_people.svg"),
                    ),
                    sizebox10H,
                    Text(
                      locale.joinATeam,
                      style: h1,
                    ),
                    Text(
                      locale.enterCodeToJoinTeam,
                      textAlign: TextAlign.center,
                      style: h2,
                    ),
                    sizebox10H,
                    _buildCodeField(),
                    const Spacer(),
                    sizebox15H,
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: MRoundedButton(
                        locale.continueText,
                        () => cubit?.joinTeam(_pinController.text.trim()),
                      ),
                    ),
                    sizebox15H,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeField() {
    return Pinput(
      length: 6,
      controller: _pinController,
      focusNode: _focusNode,
      autofocus: false,
      errorText: locale.wrongCode(_pinController.text),
      forceErrorState: errorState,
      preFilledWidget: Container(
        width: 7,
        height: 1.5,
        color: ColorStyle.outline100Color,
      ),
      defaultPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
        color: ColorStyle.backgroundColor,
        border: Border.all(color: ColorStyle.outline100Color),
        borderRadius: BorderRadius.circular(6),
      )),
      focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: ColorStyle.backgroundColor,
            border: Border.all(color: ColorStyle.blackColor),
            borderRadius: BorderRadius.circular(6),
          ),
          textStyle: const TextStyle(
              color: ColorStyle.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700)),
      submittedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: ColorStyle.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: ColorStyle.blackColor),
          ),
          textStyle: const TextStyle(
              color: ColorStyle.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700)),
      errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: ColorStyle.backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: ColorStyle.red100Color),
          ),
          textStyle: const TextStyle(
              color: ColorStyle.red100Color,
              fontSize: 20,
              fontWeight: FontWeight.w700)),
      onChanged: (value) {},
      onTap: () {
        cubit?.fieldTapped();
      },
      showCursor: true,
      cursor: cursor,
    );
  }
}
