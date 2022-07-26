import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raro_buddy_group_4/utils/validators.dart';
import 'package:raro_buddy_group_4/widgets/input_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderIdentity gender = GenderIdentity.vazio;
  bool isChecked = false;
  bool isHiddenPassword = true;
  bool isHiddenConfirmatePassword = true;
  String currentPassword = '';
  String dropdownValue = '';
  String birthdate = 'birthdate';
  MaskedTextController cpfController =
      MaskedTextController(mask: '000.000.000-00');

  MaskedTextController birthdateController =
      MaskedTextController(mask: '00/00/0000');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  InputBorder inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  InputTextWidget(
                    labelText: 'Nome',
                    validator: Validators.validateName,
                    onChanged: (value) {},
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                  ),
                  InputTextWidget(
                    labelText: 'E-mail',
                    validator: Validators.validateEmail,
                    onChanged: (value) {},
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  InputTextWidget(
                    labelText: 'Senha',
                    obscureText: isHiddenPassword,
                    validator: Validators.validatePassword,
                    onChanged: (value) {
                      setState(() {
                        currentPassword = value;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    togglePasswordView: () {
                      setState(() {
                        isHiddenPassword = !isHiddenPassword;
                      });
                    },
                  ),
                  InputTextWidget(
                    labelText: 'Confirmar senha',
                    obscureText: isHiddenConfirmatePassword,
                    validator: (value) =>
                        Validators.confirmatePassword(value, currentPassword),
                    textInputAction: TextInputAction.next,
                    togglePasswordView: () {
                      setState(() {
                        isHiddenConfirmatePassword =
                            !isHiddenConfirmatePassword;
                      });
                    },
                  ),
                  InputTextWidget(
                    labelText: 'CPF',
                    onChanged: (value) {},
                    controller: cpfController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: Validators.validateCPF,
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  InputTextWidget(
                    controller: birthdateController,
                    labelText: 'Data de birthdate',
                    onChanged: (value) {},
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: Validators.validateBirthdate,
                    inputFormatters: [
                      // obrigatório
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Identidade de Gênero',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  FormField<GenderIdentity>(
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(
                                vertical: -3, horizontal: -4),
                            title: const Text(
                              'Masculino',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            leading: Radio<GenderIdentity>(
                              value: GenderIdentity.masculino,
                              groupValue: gender,
                              onChanged: (genderSelected) {
                                setState(() {
                                  gender = genderSelected!;
                                  state.didChange(genderSelected);
                                });
                              },
                            ),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(
                                vertical: -3, horizontal: -4),
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
                                  state.didChange(genderSelected);
                                });
                              },
                            ),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity: const VisualDensity(
                                vertical: -3, horizontal: -4),
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
                                  state.didChange(genderSelected);
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              state.errorText ?? '',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    validator: (value) => Validators.validateGender(gender),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Turma',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        isExpanded: true,
                        isDense: true,
                        validator: Validators.validateGroup,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FormField<bool>(
                        builder: (state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                                          isChecked = value!;
                                          state.didChange(value);
                                        });
                                      }),
                                  const Text(
                                    'Concordo com os termos',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
//display error in matching theme
                              Text(
                                state.errorText ?? '',
                                style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          );
                        },
                        validator: (value) =>
                            Validators.validateTerms(isChecked)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 240,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint('Conta criada com sucesso');
                          } else {
                            debugPrint(
                                'Não foi possível criar conta no momento e os erros devem ser revisados');
                          }
                        },
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum GenderIdentity { masculino, feminino, outro, vazio }
