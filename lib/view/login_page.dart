import 'package:flutter/material.dart';
import 'package:r_player/model/shared_preferences_logic.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 67, 67, 1),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(67, 67, 67, 1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(91, 91, 91, 1), //色
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(-2, -2),
              ),
              BoxShadow(
                color: Color.fromRGBO(43, 43, 43, 1), //色
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
          ),
          constraints: const BoxConstraints(
            minHeight: 0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 56),
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Image.asset(
                  'assets/images/player_app_title.png',
                ),
              ),
              const Column(
                children: [
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      labelText: 'ID',
                      hintText: 'ユーザーIDを入力してください',
                      contentPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'パスワードを入力してください',
                      contentPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                child: InkWell(
                  onTap: () async {
                    Uuid uuid = const Uuid();
                    String userId = uuid.v4();
                    await SharedPreferencesLogic().saveUserID(userId);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/connect',
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(67, 67, 67, 1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(91, 91, 91, 1), //色
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(-2, -2),
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(43, 43, 43, 1), //色
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    constraints: const BoxConstraints(minHeight: 0),
                    child: const Text(
                      '登録',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
