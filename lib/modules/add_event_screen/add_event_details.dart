// ignore_for_file: unused_label

import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/add_event_screen/widgets/textfield_widget.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/jHijri.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

class AddEventDetails extends StatefulWidget {
  const AddEventDetails({super.key, required this.isdark});
  final bool isdark;

  @override
  State<AddEventDetails> createState() => _AddEventDetailsState();
}

class _AddEventDetailsState extends State<AddEventDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<CalendarCubit, CalendarStates>(
      listener: (context, state) {
        if (state is SuccessAddDataToDataBaseState) {
          Navigator.pop(context);
          myToast(message: S.of(context).addevent);
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).eventa),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextfieldWidget(
                  size: size,
                  name: S.of(context).eventname,
                  icon: Icons.event_available_outlined,
                  controller: nameController,
                  ontap: () {},
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextfieldWidget(
                  size: size,
                  name: S.of(context).eventdate,
                  icon: Icons.calendar_month_outlined,
                  controller: dateController,
                  ontap: () async {
                    await showGlobalDatePicker(
                        locale: const Locale('ar'),
                        onChange: (datetime) {
                          CalendarCubit.get(context).eventdate = datetime.date;
                          String formattedDate =
                              DateFormat.yMMMEd().format(datetime.date);
                          var day = datetime.jhijri.day.toString();
                          var mounth = datetime.jhijri.monthName.toString();
                          var year = datetime.jhijri.year.toString();
                          String date = '$formattedDate - $day $mounth $year';
                          CalendarCubit.get(context).dateTime = formattedDate;
                          CalendarCubit.get(context).jHijridate =
                              '$day $mounth $year';
                          dateController.text = date;
                        },
                        onOk: (datetime) {
                          Navigator.pop(context);
                        },
                        startDate: JDateModel(jhijri: JHijri.now()),
                        primaryColor: myColor,
                        buttonTextColor:
                            widget.isdark ? Colors.white : Colors.black,
                        calendarTextColor:
                            widget.isdark ? Colors.white : Colors.black,
                        backgroundColor:
                            widget.isdark ? blackColor : Colors.white,
                        context: context,
                        pickerType: PickerType.JNormal);
                  },
                  textInputType: TextInputType.none,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.grey[300],
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (CalendarCubit.get(context).eventdate.day ==
                            DateTime.now().day) {
                          myToast(message: S.of(context).message);
                        } else {
                          CalendarCubit.get(context).addDataToDatabase(
                              name: nameController.text,
                              date: dateController.text);
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        S.of(context).add,
                        style: TextStyle(color: myColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
