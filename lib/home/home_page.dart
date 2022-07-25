import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raro_buddy_group_4/utils/validators.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderIdentity gender = GenderIdentity.masculino;
  bool isChecked = false;
  String currentPassword = '';
  String dropdownValue = 'Flutter';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  InputBorder inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Raro Buddy',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12),
                margin: const EdgeInsets.all(12),
                child: const Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: Validators.validateName,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: Validators.validateEmail,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  cursorColor: Colors.black,
                  validator: Validators.validatePassword,
                  onChanged: (value) {
                    setState(() {
                      currentPassword = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) {
                    if (Validators.confirmatePassword(value, currentPassword)) {
                      return "As senhas não condizem";
                    } else {
                      return null;
                    }
                    ;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                      },
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'CPF',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
                    child: Text(
                      'Identidade de Gênero',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    dense: true,
                    visualDensity:
                        const VisualDensity(vertical: -3, horizontal: -4),
                    title: const Text(
                      'Masculino',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: Radio<GenderIdentity>(
                      value: GenderIdentity.masculino,
                      groupValue: gender,
                      onChanged: (GenderIdentity? genderSelected) {
                        setState(() {
                          gender = genderSelected!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity:
                        const VisualDensity(vertical: -3, horizontal: -4),
                    title: const Text(
                      'Feminino',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: Radio<GenderIdentity>(
                      value: GenderIdentity.feminino,
                      groupValue: gender,
                      onChanged: (GenderIdentity? genderSelected) {
                        setState(() {
                          gender = genderSelected!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity:
                        const VisualDensity(vertical: -3, horizontal: -4),
                    title: const Text(
                      'Outro',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: Radio<GenderIdentity>(
                      value: GenderIdentity.outro,
                      groupValue: gender,
                      onChanged: (GenderIdentity? genderSelected) {
                        setState(() {
                          gender = genderSelected!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
                    child: Text(
                      'Turma',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: InputDecorator(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        isExpanded: true,
                        isDense: true,
                        value: dropdownValue,
                        items: <String>['Flutter', 'NodeJS', 'QA']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        }),
                    const Text(
                      'Concordo com os termos.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum GenderIdentity { masculino, feminino, outro }
