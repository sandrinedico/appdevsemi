import 'package:flutter/material.dart';
import 'package:sanny/model/user.dart';
import 'package:sanny/userService.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _userCorrelationController = TextEditingController();
  final _userNameController = TextEditingController();
  final _userAgeController = TextEditingController();
  final _userBirthdayController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  bool _validateCorrelation = false;
  bool _validateName = false;
  bool _validateAge = false;
  bool _validateBirthday = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  final _userService = UserService();

// Functions that will add customer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Emergency Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details Form',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userCorrelationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'Ex: Father',
                    labelText: 'Correlation of the Owner',
                    errorText: _validateCorrelation
                        ? 'Please input your Correlation!'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'Ex: Sandrine Dico',
                    labelText: 'Name',
                    errorText: _validateName ? 'Please input your Name!' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userAgeController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.question_mark_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'Ex: 21 years old',
                    labelText: 'Age',
                    errorText: _validateAge ? 'Please input Age!' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userBirthdayController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'March 20, 2021',
                    labelText: 'Birthday',
                    errorText:
                        _validateBirthday ? 'Please input Birthday!' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userContactController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.numbers_rounded,
                      color: Colors.black,
                    ),
                    hintText: 'Ex: 09664447235',
                    labelText: 'Input your Contact Number',
                    errorText: _validateContact
                        ? 'Please input your Contact Number!'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userDescriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.black,
                    ),
                    hintText:
                        'Ex: Tambo Cagayan de Oro City in front of Contreras and Waiting Shed',
                    labelText: 'Input your Description Address',
                    errorText: _validateDescription
                        ? 'Please Input your Description Address!'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black54,
                          backgroundColor: Colors.pink[100],
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userCorrelationController.text.isEmpty
                              ? _validateCorrelation = true
                              : _validateCorrelation = false;
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userAgeController.text.isEmpty
                              ? _validateAge = true
                              : _validateAge = false;
                          _userBirthdayController.text.isEmpty
                              ? _validateBirthday = true
                              : _validateBirthday = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;
                        });
                        if (_validateCorrelation == false &&
                            _validateName == false &&
                            _validateAge == false &&
                            _validateBirthday == false &&
                            _validateContact == false &&
                            _validateDescription == false) {
                          var user = UserCustomer();
                          user.correlation = _userCorrelationController.text;
                          user.name = _userNameController.text;
                          user.age = _userAgeController.text;
                          user.birthday = _userBirthdayController.text;
                          user.contact = _userContactController.text;
                          user.description = _userDescriptionController.text;
                          var result = await _userService.SaveUser(user);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black54,
                          backgroundColor: Colors.pink[100],
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userCorrelationController.text = '';
                        _userNameController.text = '';
                        _userAgeController.text = '';
                        _userBirthdayController.text = '';
                        _userContactController.text = '';
                        _userDescriptionController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
