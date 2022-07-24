import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderIdentity gender = GenderIdentity.masculino;
  bool isChecked = false;
  String dropdownValue = 'Flutter';

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
        child: Column(
          children: [
            Text('Criar Conta'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'CPF'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data de Nascimento'),
            ),
            Text('Identidade de Gênero'),
            ListTile(
              title: const Text('Masculino'),
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
              title: const Text('Feminino'),
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
              title: const Text('Outro'),
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
            Text('Turma'),
            DropdownButton(
                value: dropdownValue,
                items: <String>['Flutter', 'NodeJS', 'QA']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                }),
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    }),
                Text('Concordo com os termos.'),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text('Criar Conta')),
          ],
        ),
      ),
    );
  }
}

enum GenderIdentity { masculino, feminino, outro }
