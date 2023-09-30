import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/messsage_screen/widgets/text_form_feild_widget.dart';
import 'package:calendar_app/modules/settings_screen/settings_screen.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    messagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, CalendarStates>(
      listener: (context, state) {
        if (state is SuccessSendMessageState) {
          navigatorToAndfinish(
              context,
              const SettingsScreen(
                ish: true,
              ));
          myToast(message: S.of(context).messagesend);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).messagem),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormFeildWidget(
                    controller: namecontroller,
                    lablel: S.of(context).rename,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormFeildWidget(
                    controller: emailcontroller,
                    lablel: S.of(context).email,
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormFeildWidget(
                    controller: messagecontroller,
                    lablel: S.of(context).messagem,
                    maxLines: 10,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  state is LoadingSendMessageState
                      ? const Center(child: CircularProgressIndicator())
                      : MaterialButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          onPressed: () {
                            var uuid = const Uuid().v4();

                            if (formkey.currentState!.validate()) {
                              CalendarCubit.get(context).sendMessage(
                                email: emailcontroller.text,
                                message: messagecontroller.text,
                                name: namecontroller.text,
                                uid: uuid,
                              );
                            }
                          },
                          color: myColor,
                          child: Text(
                            S.of(context).send,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
